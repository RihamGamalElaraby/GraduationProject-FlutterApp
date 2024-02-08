import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  Color backgroundColor = Color.fromARGB(255, 162, 192, 217);
  Color containerColor = Color.fromARGB(255, 21, 129, 216);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              height: 75,
              width: 150,
              decoration: BoxDecoration(
                color: containerColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                  child: Text(
                'Comfy View',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              )),
            ),
            Image(
              image: AssetImage('images/logo.png'),
            )
          ],
        ),
      ),
    );
  }
}
