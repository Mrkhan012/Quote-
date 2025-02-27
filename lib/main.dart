import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:quote/route/route.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides(); // 🔹 Fix for SSL issues
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false, // 🔹 Remove debug banner
      title: 'Random Quote App',
      getPages: AppRoutes.appRoutes(),
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          bodyMedium: TextStyle(fontSize: 16, color: Colors.black54),
        ),
      ),
    );
  }
}

// 🔹 Fix SSL issues for API requests (Temporary Solution)
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}
