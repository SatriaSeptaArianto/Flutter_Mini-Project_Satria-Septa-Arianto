import 'package:covid_app/screens/login/login_screen.dart';
import 'package:covid_app/services/auth_controller.dart';
import 'package:covid_app/widgets/checking.dart';
import 'package:flutter/material.dart';
import 'package:covid_app/widgets/uname_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:covid_app/widgets/password_field.dart';
import 'package:covid_app/widgets/start_button.dart';
import 'background.dart';
import 'or_divider.dart';
import 'socmed.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    Size size = MediaQuery.of(context).size;
    final authC = Get.find<AuthController>();

    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "REGISTER",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/register.svg",
              height: size.height * 0.35,
            ),
            UnameField(
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            PasswordField(
              onChanged: (value) {},
            ),
            StartButton(
              text: "SIGNUP",
              press: () {
                authC.register(emailController.text, passwordController.text);
              },
            ),
            SizedBox(height: size.height * 0.03),
            CheckAccount(
              login: false,
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
            const OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocalIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/twitter.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}