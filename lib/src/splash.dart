import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Expanded(
          child: Container(
            margin: EdgeInsets.only(top: 40),
            height: 128,
            width: 128,
            child: Image.asset('assets/hash.png'),
          ),
        ),
        // Image.asset('assets/hash.png'),
        Image.asset(
          'assets/splash.png',
          fit: BoxFit.cover,
        ),
      ],
    ));
  }
}
