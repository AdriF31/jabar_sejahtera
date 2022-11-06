import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jabar_sejahtera/helper/storage_core.dart';
import 'package:jabar_sejahtera/shared/theme.dart';
import 'package:jabar_sejahtera/ui/auth/login/sign_in_page.dart';
import 'package:jabar_sejahtera/ui/main_page.dart';
import 'package:jabar_sejahtera/ui/onboarding/onboarding_page.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final storage = StorageCore();
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      // Navigator.pushReplacementNamed(context, OnboardingPage.routeName);
      if (storage.getAccessToken() == null ||
          storage.getAccessToken() == "token_not_loaded") {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SignInPage()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MainPage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
          child: Image.asset(
        'assets/img_logo.png',
        width: 235,
        height: 90,
      )),
    );
  }
}
