import 'package:flutter/material.dart';
import 'package:tokoto/util/ucolor.dart';

import 'onboard_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const OnboardView(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/splash.png",
              height: 240,
              width: 240,
            ),
            const SizedBox(height: 20),
            const Text(
              "TOKOTO",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: UColor.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
