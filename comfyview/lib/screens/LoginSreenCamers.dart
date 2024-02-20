import 'package:flutter/material.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  // Color backgroundColor = Colors.blue[600];
  Color containerColor = const Color.fromARGB(255, 21, 129, 216);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
              Container(
                height: 50,
                width: 270,
                decoration: BoxDecoration(
                  color: Colors.blue[300],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Center(
                    child: Text(
                  'Comfy View',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                )),
              ),
              const SizedBox(
                height: 15,
              ),
              const Center(
                child: Text(
                  'Login',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              // SizedBox(
              //   height: 30,
              // ),
              const Image(
                height: 200,
                width: double.infinity,
                image: AssetImage('images/faceprint.png'),
              ),
              const Text(
                'We protect your information with',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                'Face-print',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Open Camera',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 19,
                        fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      highlightColor: Colors.yellow,
                      onPressed: () {},
                      icon: const Icon(Icons.camera_alt_outlined)),
                ],
              ),
              ConditionalBuilder(
                  condition: true,
                  // condition: state is! ShopLoginLoadingStates,
                  builder: (context) => SizedBox(
                        width: 300,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'layoutScreen');
                            // if (formKey.currentState!.validate()) {
                            //   LoginCubit.get(context).userLogin(
                            //       email: emailController.text,
                            //       Password: passwarController.text);
                            // }
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 24.0), backgroundColor: const Color.fromRGBO(30, 136, 229, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ), // Text color
                            elevation: 10.0, // Elevation
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(
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
                      )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Login Using Passward!',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
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
                            fontWeight: FontWeight.bold),
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don\'t have an account!',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
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
                            fontWeight: FontWeight.bold),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
