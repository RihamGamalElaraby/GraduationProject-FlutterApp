import 'dart:io';

import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late CameraController _cameraController;
  late List<CameraDescription> _cameras;
  bool _isCameraReady = false;
  File? imageFile;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      _cameras = await availableCameras();
      // Find the front camera
      CameraDescription frontCamera = _cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front,
      );
      _cameraController = CameraController(frontCamera, ResolutionPreset.high);
      await _cameraController.initialize();
      if (!mounted) return;
      setState(() {
        _isCameraReady = true;
      });
    } catch (e) {
      print("Error initializing camera: $e");
    }
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  Future<void> _takePicture(BuildContext context) async {
    if (!_isCameraReady) {
      return;
    }

    try {
      final XFile picture = await _cameraController.takePicture();
      final File imageFile = File(picture.path);
      await _uploadPhoto(imageFile, context);
    } catch (e) {
      print("Error taking picture: $e");
    }
  }

  Future<void> _uploadPhoto(File imageFile, BuildContext context) async {
    try {
      Dio dio = Dio();
      FormData formData = FormData.fromMap({
        'photo': await MultipartFile.fromFile(imageFile.path),
      });

      // Post photo to the API
      Response response = await dio.post(
        'https://9630-105-93-189-107.ngrok-free.app/compare_faces',
        data: formData,
      );

      // Check response and show dialog accordingly
      if (response.data['similarities'] != 'None') {
        _showSuccessDialog(context, response.data['similarities']);
      } else {
        _showSuccessDialog(context, response.data['similarities']);
      }
    } catch (e) {
      print("Error uploading photo: $e");
    }
  }

  Future<void> _getImageFromGallery(BuildContext context) async {
    final pickedFile = await _picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
        _uploadPhoto(imageFile!, context);
      });
    }
  }

  Future<void> _getImageFromCamera(BuildContext context) async {
    final pickedFile = await _picker.getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
        _uploadPhoto(imageFile!, context);
      });
    }
  }

  void _showSuccessDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Success"),
          content: Text("Hello $message"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, 'layoutScreen');
              },
              child: const Row(
                children: [
                  Text("Go to Layout"),
                  Icon(Icons.arrow_forward),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  void _showErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Error"),
          content: const Text("Please try again"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Dismiss dialog
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, // Remove appbar shadow
      ),
      backgroundColor: Colors.white,
      body: !_isCameraReady
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildLogo(), // Customized logo widget
                    const SizedBox(height: 20),
                    const Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildFacePrintInfo(), // Customized faceprint information
                    const SizedBox(height: 20),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     const Text(
                    //       'Open Camera',
                    //       style: TextStyle(
                    //         color: Colors.black,
                    //         fontSize: 19,
                    //         fontWeight: FontWeight.bold,
                    //       ),
                    //     ),
                    //     IconButton(
                    //       onPressed: () {
                    //         _takePicture(context);
                    //       },
                    //       icon: const Icon(Icons.camera_alt_outlined),
                    //     ),
                    //   ],
                    // ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Open Camera',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            _getImageFromCamera(context);
                          },
                          icon: const Icon(Icons.camera_alt_outlined),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    _buildOtherOptions(
                        context), // Customized other options (password login, registration)
                  ],
                ),
              ),
            ),
    );
  }

  Widget _buildLogo() {
    return Container(
      height: 150,
      width: 150,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 248, 250, 252),
        shape: BoxShape.circle,
      ),
      child: Image.asset(
        'images/logo.png',
        width: 300,
        height: 150,
      ),
    );
  }

  Widget _buildFacePrintInfo() {
    return const Column(
      children: [
        Text(
          'We protect your information with',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Face-print',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildOtherOptions(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Login Using Password!',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, 'loginScreenPass');
              },
              child: const Text(
                'HERE',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Don\'t have an account?',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, 'RegisterScreen');
              },
              child: const Text(
                'REGISTER',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
