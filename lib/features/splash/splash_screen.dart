import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quran_app/features/home/screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;
  goNext() => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen ()),
      (route) => false);
  startDely() {
    _timer = Timer(const Duration(seconds: 5), () {
      goNext();
    });
  }

  @override
  void initState() {
    super.initState();
    startDely();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF230E4E),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 150,
            ),
            Lottie.asset('assets/animation/p]de.json')
          ],
        ),
      ),
    );
  }
}
