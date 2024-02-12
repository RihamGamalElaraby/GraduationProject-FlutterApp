import 'package:flutter/material.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

class LoginScreenPassword extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwarController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Login',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    'Using Passward',
                    style: Theme.of(context)
                        .textTheme
                        ?.bodyLarge
                        ?.copyWith(color: Colors.black),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null) {
                        return 'please enter your email address';
                      }
                    },
                    decoration: InputDecoration(
                      label: Text('E-mail'),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 5.0),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(30, 136, 229, 1), width: 2.0),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      prefixIcon: Icon(Icons.email),
                      hintText: 'email',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: passwarController,
                    onFieldSubmitted: (value) {
                      if (formKey.currentState!.validate()) {
                        // LoginCubit.get(context).userLogin(
                        //     email: emailController.text,
                        //     Password: passwarController.text);
                      }
                    },
                    obscureText: true,
                    // obscureText: LoginCubit.get(context).isObsecure,
                    validator: (value) {
                      if (value == null) {
                        return 'please enter your passward';
                      }
                    },
                    decoration: InputDecoration(
                        label: Text('Passward'),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 5.0),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(30, 136, 229, 1),
                              width: 2.0),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        prefixIcon: IconButton(
                          icon: Icon(Icons.lock),
                          onPressed: () {},
                        ),
                        hintText: 'passward',
                        // suffixIcon: IconButton(
                        //   icon: Icon(LoginCubit.get(context).suffix),
                        //   onPressed: () {
                        //     LoginCubit.get(context).changePasswordVisibility();
                        //   },
                        // )
                        suffixIcon: IconButton(
                          icon: Icon(Icons.visibility),
                          onPressed: () {},
                        )),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ConditionalBuilder(
                      condition: true,
                      // condition: state is! ShopLoginLoadingStates,
                      builder: (context) => Container(
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
                                padding: EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 24.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                primary: Color.fromRGBO(30, 136, 229, 1),
                                // Background color
                                onPrimary: Colors.white, // Text color
                                elevation: 10.0, // Elevation
                              ),
                              child: Text(
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
                      Text(
                        'Don\'t have an account?',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'RegisterScreen');
                          },
                          child: Text('REGISTER')),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
