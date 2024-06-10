import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tokoto/firebase_options.dart';
import 'package:tokoto/util/ucolor.dart';
import 'package:tokoto/view/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: UColor.primary),
      ),
      home: const SplashView(),
    );
  }
}
