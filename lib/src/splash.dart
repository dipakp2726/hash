import 'dart:async';

import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final splashDelay = 3;

  @override
  void initState() {
    super.initState();

    _loadWidget();
  }

  Future<Timer> _loadWidget() async {
    final duration = Duration(seconds: splashDelay);
    return Timer(
        duration, () => Navigator.pushReplacementNamed(context, '/login'),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        const SizedBox(height: 40),
        Expanded(
          child: Image.asset(
            'assets/hash.png',
            height: 128,
            width: 128,
          ),
        ),
        Image.asset(
          'assets/splash.png',
          fit: BoxFit.cover,
        ),
      ],
    ),);
  }
}
