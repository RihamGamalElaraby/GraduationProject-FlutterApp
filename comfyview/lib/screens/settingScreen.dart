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
            child: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
          const SizedBox(
            height: 10,
          ),
          const Divider(
            thickness: 1,
            color: Colors.blue,
          ),
          //
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CircleAvatar(
                  child: Icon(Icons.person),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text(
                  'Edit personal data',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.arrow_forward_rounded)),
              ],
            ),
          ),
          //
          const Divider(
            thickness: 1,
            color: Colors.blue,
          ),
          //
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.lock),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text(
                  'Change Password',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.arrow_forward_rounded)),
              ],
            ),
          ),
          //
          const Divider(
            thickness: 1,
            color: Colors.blue,
          ),
          //
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.contact_support),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text(
                  'Contact US',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.arrow_forward_rounded)),
              ],
            ),
          ),
          //
          const Divider(
            thickness: 1,
            color: Colors.blue,
          ),
          //
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.yellow,
                  child: Icon(Icons.rule_sharp),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text(
                  'Terms & Policy',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.arrow_forward_rounded)),
              ],
            ),
          ),
          //
          //
          const Divider(
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
                  backgroundColor: Colors.purple[200],
                  child: const Icon(Icons.help),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text(
                  'About Us',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.arrow_forward_rounded)),
              ],
            ),
          ),
          //
          const Divider(
            thickness: 1,
            color: Colors.blue,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Icon(Icons.logout),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text(
                  'Log-out',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.arrow_forward_rounded)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
