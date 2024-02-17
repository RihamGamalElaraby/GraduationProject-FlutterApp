import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Text(
          //   'Setting Screen',
          //   style: TextStyle(
          //       color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          // ),
          Container(
            height: 75,
            width: 350,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(50)),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              CircleAvatar(
                  radius: 30,
                  child: Image(
                    image: AssetImage('images/faceprint.png'),
                    // height: 65,
                  )),
              SizedBox(
                width: 30,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Willy Madde',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'WillyMadde@gmail.com',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ]),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            thickness: 1,
            color: Colors.blue,
          ),
          //
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  child: Icon(Icons.person),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Edit personal data',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.arrow_forward_rounded)),
              ],
            ),
          ),
          //
          Divider(
            thickness: 1,
            color: Colors.blue,
          ),
          //
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  child: Icon(Icons.lock),
                  backgroundColor: Colors.blue,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Change Password',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.arrow_forward_rounded)),
              ],
            ),
          ),
          //
          Divider(
            thickness: 1,
            color: Colors.blue,
          ),
          //
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  child: Icon(Icons.contact_support),
                  backgroundColor: Colors.grey,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Contact US',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.arrow_forward_rounded)),
              ],
            ),
          ),
          //
          Divider(
            thickness: 1,
            color: Colors.blue,
          ),
          //
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  child: Icon(Icons.rule_sharp),
                  backgroundColor: Colors.yellow,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Terms & Policy',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.arrow_forward_rounded)),
              ],
            ),
          ),
          //
          //
          Divider(
            thickness: 1,
            color: Colors.blue,
          ),
          //
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  child: Icon(Icons.help),
                  backgroundColor: Colors.purple[200],
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'About Us',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.arrow_forward_rounded)),
              ],
            ),
          ),
          //
          Divider(
            thickness: 1,
            color: Colors.blue,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  child: Icon(Icons.logout),
                  backgroundColor: Colors.red,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Log-out',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.arrow_forward_rounded)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
