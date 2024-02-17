import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('images/boarding3.jpg'),
            ),
            SizedBox(height: 20),
            Card(
              color: Colors.grey[300],
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text(
                        'Name',
                        style: TextStyle(fontSize: 18),
                      ),
                      subtitle: Text(
                        'John Doe',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Email',
                        style: TextStyle(fontSize: 18),
                      ),
                      subtitle: Text(
                        'john.doe@example.com',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Phone',
                        style: TextStyle(fontSize: 18),
                      ),
                      subtitle: Text(
                        '+1234567890',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'ID',
                        style: TextStyle(fontSize: 18),
                      ),
                      subtitle: Text(
                        '1234',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Navigator.pushNamed(context, 'layoutScreen');

                    // if (formKey.currentState!.validate()) {
                    //   LoginCubit.get(context).userLogin(
                    //       email: emailController.text,
                    //       Password: passwarController.text);
                    // }
                  },
                  style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    primary: Color.fromRGBO(30, 136, 229, 1),
                    // Background color
                    onPrimary: Colors.white, // Text color
                    elevation: 10.0, // Elevation
                  ),
                  child: Text(
                    'Edit Profile Data',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
