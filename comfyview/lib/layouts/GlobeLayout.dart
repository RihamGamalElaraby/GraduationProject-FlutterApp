import 'package:flutter/material.dart';
import 'package:comfyview/screens/resultScreen.dart';

class GlobalLayout extends StatefulWidget {
  const GlobalLayout({super.key});

  @override
  State<GlobalLayout> createState() => _GlobalLayoutState();
}

class _GlobalLayoutState extends State<GlobalLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: 100,
        backgroundColor: Colors.white,
        title: Text(
          'Comfy View',
          style: TextStyle(fontSize: 22, color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, 'profileScreen');
              },
              icon: Icon(
                Icons.person_3_sharp,
                size: 40,
                color: Colors.blue,
              ))
        ],
      ),
      body: resultScreen(),
      bottomNavigationBar: BottomNavigationBar(
          elevation: 100,
          selectedItemColor: Colors.blue,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                label: 'Result',
                icon: Icon(
                  Icons.front_hand_rounded,
                )),
            BottomNavigationBarItem(
                label: 'Lost&Found',
                icon: Icon(
                  Icons.search,
                )),
            BottomNavigationBarItem(
                label: 'Shoping',
                icon: Icon(
                  Icons.shopping_cart_outlined,
                )),
            BottomNavigationBarItem(
                label: 'Setting',
                icon: Icon(
                  Icons.settings,
                )),
          ]),
    );
  }
}
