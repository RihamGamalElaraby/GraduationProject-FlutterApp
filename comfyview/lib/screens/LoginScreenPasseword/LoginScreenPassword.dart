import 'package:comfyview/screens/LoginScreenPasseword/Cubit/LoginPasswordCubit.dart';
import 'package:comfyview/screens/LoginScreenPasseword/Cubit/LoginPasswordStates.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreenPassword extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  LoginScreenPassword({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwarController = TextEditingController();
    return BlocConsumer<LoginPasswordCubit, LoginPasswordStates>(
        listener: (context, state) {},
        builder: (context, state) {
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
                              .bodyLarge
                              ?.copyWith(color: Colors.black),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null) {
                              return 'please enter your email address';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            label: const Text('E-mail'),
                            focusedErrorBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 5.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(30, 136, 229, 1),
                                  width: 2.0),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            prefixIcon: const Icon(Icons.email),
                            hintText: 'email',
                          ),
                        ),
                        const SizedBox(
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
                            return null;
                          },
                          decoration: InputDecoration(
                              label: const Text('Passward'),
                              focusedErrorBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 5.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(30, 136, 229, 1),
                                    width: 2.0),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              prefixIcon: IconButton(
                                icon: const Icon(Icons.lock),
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
                                icon: const Icon(Icons.visibility),
                                onPressed: () {},
                              )),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        ConditionalBuilder(
                            // condition: true,
                            condition: state is! LoadingLoginPasswordstate,
                            builder: (context) => SizedBox(
                                  width: 300,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        LoginPasswordCubit.get(context)
                                            .userLogin(
                                                email: emailController.text,
                                                Password:
                                                    passwarController.text);
                                      }
                                      Navigator.pushNamed(
                                          context, 'layoutScreen');
                                    },
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0, horizontal: 24.0),
                                      backgroundColor:
                                          const Color.fromRGBO(30, 136, 229, 1),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
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
                            Text(
                              'Don\'t have an account?',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, 'RegisterScreen');
                                },
                                child: const Text('REGISTER')),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
