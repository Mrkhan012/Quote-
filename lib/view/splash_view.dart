import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quote/route/route_names.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _opacity = 1.0;
      });
    });

    Timer(const Duration(seconds: 3), () {
      Get.toNamed(RouteName.homeView);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              duration: const Duration(seconds: 2),
              opacity: _opacity,
              child: const Icon(
                Icons.format_quote_rounded,
                size: 100,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            AnimatedOpacity(
              duration: const Duration(seconds: 2),
              opacity: _opacity,
              child: const Text(
                "“Your time is limited, so don’t waste it.”",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
