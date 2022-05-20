import 'package:flutter/material.dart';

// Colors
const kPrimaryColor = Color(0xFF4D25A9);
const kPrimaryLightColor = Color.fromARGB(255, 255, 255, 255);
const kBackgroundColor = Color(0xFFDECDF9);
const kTitleTextColor = Color(0xFF303030);
const kBodyTextColor = Color(0xFF4B4B4B);
const kTextLightColor = Color(0xFF959595);
const kTreatedColor = Color.fromARGB(255, 239, 255, 15);
const kInfectedColor = Color.fromARGB(255, 255, 139, 72);
const kDeathColor = Color(0xFFFF4848);
const kRecoverColor = Color(0xFF36C12C);
final kShadowColor = const Color(0xFFB7B7B7).withOpacity(.16);
final kActiveShadowColor = const Color(0xFF4056C6).withOpacity(.15);

// Text Style
const kHeadingTextStyle = TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.w600,
);

const kSubTextStyle = TextStyle(fontSize: 16, color: kTextLightColor);

const kTitleTextstyle = TextStyle(
  fontSize: 18,
  color: kTitleTextColor,
  fontWeight: FontWeight.bold,
);

RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
