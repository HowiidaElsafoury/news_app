import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/pages/home/home_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  static String routeName = "splash";
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, HomeView.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage("assets/images/pattern@3x.png"),
              fit: BoxFit.cover),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(child: Image.asset("assets/images/logo.png"),),
        ));
  }
}
