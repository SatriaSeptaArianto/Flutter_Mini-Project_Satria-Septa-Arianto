import 'package:covid_app/firebase_options.dart';
import 'package:covid_app/screens/home_screen.dart';
import 'package:covid_app/screens/welcome/welcome_screen.dart';
import 'package:covid_app/services/auth_controller.dart';
import 'package:covid_app/utils/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final authC = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: authC.streamAuthStatus,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Covid 19',
          theme: ThemeData(
              scaffoldBackgroundColor: kBackgroundColor,
              fontFamily: "Poppins",
              textTheme: const TextTheme(
                bodyText1: TextStyle(color: kBodyTextColor),
              )),
          home: snapshot.data != null
              ? const HomeScreen()
              : const WelcomeScreen(),
        );
      }
    );
  }
}
