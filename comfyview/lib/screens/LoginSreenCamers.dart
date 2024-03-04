import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, // Remove appbar shadow
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildLogo(), // Customized logo widget
              SizedBox(height: 20),
              Text(
                'Login',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              _buildFacePrintInfo(), // Customized faceprint information
              SizedBox(height: 20),
              _buildOpenCameraButton(), // Customized open camera button
              SizedBox(height: 20),
              _buildLoginButton(context), // Customized login button
              SizedBox(height: 20),
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
      decoration: BoxDecoration(
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
    return Column(
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

  Widget _buildOpenCameraButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Open Camera',
          style: TextStyle(
            color: Colors.black,
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.camera_alt_outlined),
        ),
      ],
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return ConditionalBuilder(
      condition: true,
      builder: (context) => SizedBox(
        width: 300,
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, 'layoutScreen');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: Text(
            'Login',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      fallback: (context) => Center(
        child: CircularProgressIndicator(
          color: Colors.blue[900],
        ),
      ),
    );
  }

  Widget _buildOtherOptions(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
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
              child: Text(
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
            Text(
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
              child: Text(
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
