import 'dart:async';

import 'package:flutter/material.dart';

import '../main.dart';

class SplishScreen extends StatefulWidget {
  const SplishScreen({super.key});
  @override
  State<SplishScreen> createState() => _SplishScreenState();
}

class _SplishScreenState extends State<SplishScreen> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => const TokenAccess(),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("assets/splash.png"),
          ),
        ),
      ),
    );
  }
}
