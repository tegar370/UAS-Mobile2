import 'package:flutter/material.dart';

class WhiteScreen extends StatelessWidget {
  const WhiteScreen({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
    );
  }
}
