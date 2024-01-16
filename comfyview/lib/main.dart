import 'package:flutter/material.dart';
import 'screens/LoginSreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 40, 183, 230)),
        useMaterial3: true,
      ),
      home: LoginScreen(),
    );
  }
}
