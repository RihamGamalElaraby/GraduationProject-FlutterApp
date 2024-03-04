import 'package:comfyview/cubit/cubit.dart';
import 'package:comfyview/cubit/states.dart';
import 'package:comfyview/database/dioHelper.dart';
import 'package:comfyview/layouts/GlobeLayout.dart';
import 'package:comfyview/screens/LoginScreenPasseword/Cubit/LoginPasswordCubit.dart';
import 'package:comfyview/screens/LoginSreenCamers.dart';
import 'package:comfyview/screens/ProfileScreen.dart';
import 'package:comfyview/screens/RegisterScreen/Cubit/RegisterCubit.dart';
import 'package:comfyview/screens/ecommerceScreen.dart';
import 'package:comfyview/screens/lostandFoundScreen.dart';
import 'package:comfyview/screens/resultScreen.dart';
import 'package:comfyview/screens/settingScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/blocObserver.dart';
import 'firebase_options.dart';
import 'screens/LoginScreenPasseword/LoginScreenPassword.dart';
import 'screens/RegisterScreen/registerScreen.dart';
import 'screens/WelcomeScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();
  DioHelper.dio;
  // DioHelper.dio();
  ///////////////////////////////////////////////////////////////
  // FirebaseFirestore firestore = FirebaseFirestore.instance;

  // // List to store photo URLs
  // List<Map<String, String>> photoList = [];

  // // Listen to changes in the 'reham' collection
  // firestore.collection('Reham').snapshots().listen((QuerySnapshot snapshot) {
  //   snapshot.docChanges.forEach((change) {
  //     if (change.type == DocumentChangeType.added ||
  //         change.type == DocumentChangeType.modified) {
  //       var newValue = change.doc.data();
  //       // Ensure newValue is Map<String, dynamic>
  //       if (newValue is Map<String, dynamic>) {
  //         bool done = newValue['done'];

  //         // Check if the 'done' field is false
  //         if (!done) {
  //           // Ensure newValue['photo'] is Map<String, dynamic>
  //           if (newValue['photo'] is Map<String, dynamic>) {
  //             var photoUrl = newValue['photo']['url'];
  //             photoList.add({'photo': photoUrl});
  //           }
  //         }
  //       }
  //     }
  //   });

  //   // Print or further process the list
  //   print(photoList);
  // });
  /////////////////////////////////////////////////////////////////////////////
  runApp(
    MultiBlocProvider(
      child: const MyApp(),
      providers: [
        BlocProvider(
          create: (context) => ComfyviewCubit(),
        ),
        BlocProvider(
          create: (context) => LoginPasswordCubit(),
        ),
        BlocProvider(create: (context) => RegisterCubit())
      ],
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ComfyviewCubit, ComfyviewState>(
        listener: (context, state) => {},
        builder: (context, state) {
          return MaterialApp(
            title: 'Comfy View',
            // home: OnBoardingScreen(),
            theme: ThemeData(
              primaryColor: Colors.blue[600],
              textTheme: const TextTheme(
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
                iconTheme: const IconThemeData(
                  color: Color.fromRGBO(169, 166, 165, 0.612),
                ),
                titleTextStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarBrightness: Brightness.dark,
                ),
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                selectedItemColor: Color.fromRGBO(3, 3, 3, 0.612),
                backgroundColor: Colors.white,
                type: BottomNavigationBarType.fixed,
                elevation: 100,
              ),
              colorScheme: ColorScheme.fromSeed(
                seedColor: const Color.fromARGB(99, 0, 0, 0),
              ),
              useMaterial3: true,
            ),

            initialRoute: 'welcomeScreen',
            routes: {
              'welcomeScreen': (context) => const OnBoardingScreen(),
              'loginScreenCamera': (context) => LoginScreen(),
              'layoutScreen': (context) => const GlobalLayout(),
              'loginScreenPass': (context) => LoginScreenPassword(),
              'RegisterScreen': (context) => RegisterScreen(),
              'ResultScreen': (context) => resultScreen(),
              'profileScreen': (context) => const ProfileScreen(),
              'settinfScreen': (context) => const SettingScreen(),
              'lostandfound': (context) => LostAndFound(),
              'ecommerceScreen': (context) => const EcommerceScreen(),
            },
          );
        });
  }
}
