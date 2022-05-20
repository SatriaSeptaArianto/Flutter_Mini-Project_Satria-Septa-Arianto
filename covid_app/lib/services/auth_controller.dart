// ignore_for_file: unused_import

import 'package:covid_app/screens/home_screen.dart';
import 'package:covid_app/screens/login/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{
  static AuthController instance = Get.find();
  // late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;
  Stream<User?> get streamAuthStatus => auth.authStateChanges();

  // @override
  // void onReady(){
  //   super.onReady();
  //   _user = Rx<User?>(auth.currentUser);
  //   _user.bindStream(auth.userChanges());
  //   ever(_user, _initialScreen);
  // }

  // _initialScreen(User? user){
  //   if(user==null){
  //     // print("Login Page");
  //     Get.offAll(()=>const LoginScreen());
  //   }else{
  //     Get.offAll(()=>const HomeScreen());
  //   }
  // }

  void register(String email, String password) async {
    try{
      print("tes");
      final credential = await auth.createUserWithEmailAndPassword(email: email, password: password);
      credential.user!.sendEmailVerification();
      Get.defaultDialog(
        middleText: "Verifikasi Email Sudah Terkirim, Silahkan Cek Email",
        textConfirm: "Ya",
        radius: 5,
        buttonColor: Colors.redAccent,
        confirmTextColor: Colors.white,
        onConfirm: () {
          Get.back();
          Get.offAll(() => const LoginScreen());
        });
    }
    on FirebaseAuthException catch(e)
    // catch (firebaseAuthException)
    {
      if (e.code == 'weak-password') {
        print("tes");
        Get.defaultDialog(
            title: "Password Lemah",
            middleText: "Password harus lebih dari 6 Karakter");
      } else if (e.code == 'email-already-in-use') {
        print("tes");
        Get.defaultDialog(
            title: "Email Sudah Terdaftar",
            middleText: "Silahkan coba email lain");
      }
      // Get.snackbar("About User", "User message",
      // snackPosition: SnackPosition.BOTTOM,
      //   titleText: const Text(
      //     "Account creation failed",
      //     style: TextStyle(
      //       color: Colors.white
      //     ),
      //   ),
      //   messageText: Text(
      //     e.toString(),
      //     style: const TextStyle(
      //       color: Colors.white
      //     )
      //   ),
      // );
    } catch (e){
      Get.defaultDialog();
    }
  }

  void login(String email, String password) async {
    try{
      print("tes");
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (credential.user!.emailVerified) {
        Get.snackbar("Berhasil", "Login Sukses",
            backgroundColor: Colors.redAccent, colorText: Colors.white);
        Get.offAll(() => const HomeScreen());
      } else {
        Get.defaultDialog(
            title: "Verifikasi",
            middleText: "Email Belum Diverifikasi",
            onConfirm: () async {
              await credential.user!.sendEmailVerification();
              Get.back();
            },
            radius: 5,
            buttonColor: Colors.redAccent,
            confirmTextColor: Colors.white,
            cancelTextColor: Colors.redAccent,
            textConfirm: "Kirim Ulang Verifikasi",
            onCancel: () {
              Get.back();
            },
            textCancel: "Kembali");
      }
    } on FirebaseAuthException catch(e) {
      if (e.code == 'user-not-found') {
        print("tes");
        Get.snackbar("Email tidak terdaftar", "Silahkan Daftar",
            backgroundColor: Colors.redAccent, colorText: Colors.white);
      } else if (e.code == 'wrong-password') {
        print("tes");
        Get.snackbar("Password Salah", "Silahkan Coba Lagi",
            backgroundColor: Colors.redAccent, colorText: Colors.white);
      }else if(e.code == 'invalid-email'){
        print("tes");
        Get.snackbar("Email Tidak Valid", "Silahkan Coba Lagi",
            backgroundColor: Colors.redAccent, colorText: Colors.white);
      }
      // Get.snackbar("About User", "User message",
      // snackPosition: SnackPosition.BOTTOM,
      //   titleText: const Text(
      //     "Login failed",
      //     style: TextStyle(
      //       color: Colors.white
      //     ),
      //   ),
      //   messageText: Text(
      //     e.toString(),
      //     style: const TextStyle(
      //       color: Colors.white
      //     )
      //   ),
      // );
    } catch (e){
      Get.defaultDialog();
    }
  }

  void logout() async {
    await auth.signOut();
  }
}