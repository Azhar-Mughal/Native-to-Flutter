import 'package:flutter/material.dart';
import 'package:flutter_stepper/ui/splash/view/splash_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'TyrAds Task';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
