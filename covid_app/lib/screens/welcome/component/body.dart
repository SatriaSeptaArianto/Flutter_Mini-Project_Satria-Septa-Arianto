import 'package:covid_app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:covid_app/screens/login/login_screen.dart';
import 'package:covid_app/screens/register/register_screen.dart';
import 'background.dart';
import '../../../widgets/start_button.dart';

class Body extends StatelessWidget {
  const Body({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(  context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Welcome to Co19tion',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height *0.05),
              Image.asset(
                'assets/images/logo.png',
                height: size.height * 0.2
              ),
              SizedBox(height: size.height *0.05),
              StartButton(
                text: 'LOGIN',
                press: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return const LoginScreen();
                      },
                      transitionsBuilder: (context, animation, secondaryAnimation, child) {
                        final tween = Tween(begin: 0.0, end: 1.0);
                        return FadeTransition(
                          opacity: animation.drive(tween),
                          child: child,
                        );
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: size.height *0.01),
              StartButton(
                text: 'REGISTER',
                color: kPrimaryLightColor,
                textColor: Colors.black,
                press: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return const RegisterScreen();
                      },
                      transitionsBuilder: (context, animation, secondaryAnimation, child) {
                        final tween = Tween(begin: 0.0, end: 1.0);
                        return FadeTransition(
                          opacity: animation.drive(tween),
                          child: child,
                        );
                      },
                    ),
                  );
                },
              ),
            ]
          ),
      ),
    );
  }
}

// Navigator.of(context).push(
//   PageRouteBuilder(
//     pageBuilder: (context, animation, secondaryAnimation) {
//       return ContactScreen()
//     },
//     transitionsBuilder: (context, animation, secondaryAnimation, child) {
//       final tween = Tween(begin: 0.0, end: 1.0);
//       return FadeTransition(
//         opacity: animation.drive(tween),
//         child: child,
//       );
//     },
//   ),
// );