import 'package:covid_app/screens/login/login_screen.dart';
import 'package:covid_app/services/auth_controller.dart';
import 'package:covid_app/utils/constant.dart';
import 'package:covid_app/widgets/start_button.dart';
import 'package:covid_app/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({
    Key? key,
  }) : super(key: key);
  
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final controller = ScrollController();
  double offset = 0;

  // @override
  // void initState() {
  //   super.initState();
  //   controller.addListener(onScroll);
  // }

  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final authC = Get.put(AuthController());
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          children: <Widget>[
            MyHeader(
              image: "assets/icons/Drcorona.svg",
              textTop: "Stay Safe",
              textBottom: "Be Careful",
              offset: offset,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  const Text(
                    "Hello, user",
                    style: kTitleTextstyle,
                  ),
                  SizedBox(height: size.height * 0.03),
                  StartButton(
                    text: "LOG OUT",
                    press: () {
                      authC.logout();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return  const LoginScreen();
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
