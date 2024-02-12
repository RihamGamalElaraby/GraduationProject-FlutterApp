import 'package:comfyview/layouts/GlobeLayout.dart';
import 'package:comfyview/screens/LoginSreenCamers.dart';
import 'package:comfyview/screens/ProfileScreen.dart';
import 'package:comfyview/screens/resultScreen.dart';
import 'package:flutter/material.dart';
import 'package:comfyview/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/blocObserver.dart';
import 'package:comfyview/cubit/cubit.dart';
import 'screens/WelcomeScreen.dart';
import 'package:flutter/services.dart';
import 'screens/LoginScreenPassword.dart';
import 'screens/registerScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  runApp(
    BlocProvider(
      create: (context) => ComfyviewCubit(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ComfyviewCubit, ComfyviewState>(
        listener: (context, state) => {},
        builder: (context, state) {
          return MaterialApp(
            title: 'SuperMarket',
            // home: OnBoardingScreen(),
            theme: ThemeData(
              primaryColor: Colors.blue[600],
              textTheme: TextTheme(
                bodyLarge: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                titleMedium: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              scaffoldBackgroundColor: Colors.lightBlue[50],
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.blueGrey[50],
                iconTheme: IconThemeData(
                  color: Color.fromRGBO(169, 166, 165, 0.612),
                ),
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarBrightness: Brightness.dark,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                selectedItemColor: Color.fromRGBO(3, 3, 3, 0.612),
                backgroundColor: Colors.white,
                type: BottomNavigationBarType.fixed,
                elevation: 100,
              ),
              colorScheme: ColorScheme.fromSeed(
                seedColor: Color.fromARGB(99, 0, 0, 0),
              ),
              useMaterial3: true,
            ),

            initialRoute: 'welcomeScreen',
            routes: {
              'welcomeScreen': (context) => OnBoardingScreen(),
              'loginScreenCamera': (context) => LoginScreen(),
              'layoutScreen': (context) => GlobalLayout(),
              'loginScreenPass': (context) => LoginScreenPassword(),
              'RegisterScreen': (context) => RegisterScreen(),
              'ResultScreen': (context) => resultScreen(),
              'profileScreen': (context) => ProfileScreen(),
            },
          );
        });
  }
}
