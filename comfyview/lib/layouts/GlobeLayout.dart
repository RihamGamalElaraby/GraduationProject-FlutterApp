import 'package:flutter/material.dart';

class GlobalLayout extends StatefulWidget {
  const GlobalLayout({super.key});

  @override
  State<GlobalLayout> createState() => _GlobalLayoutState();
}

class _GlobalLayoutState extends State<GlobalLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        backgroundColor: Colors.blue[50],
        title: Center(
          child: Text(
            'Comfy View',
            style: TextStyle(color: Colors.blue[900]),
          ),
        ),
        leading: Image(
          width: 100,
          image: AssetImage(
            'images/logo.png',
          ),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.person_pin))],
      ),
      body: Text('trial'),
      bottomNavigationBar: BottomNavigationBar(
          elevation: 100,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                label: 'Result',
                icon: Icon(
                  Icons.front_hand_rounded,
                )),
            BottomNavigationBarItem(
                label: 'Search',
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
