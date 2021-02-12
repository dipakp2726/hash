import 'package:flutter/material.dart';
import 'package:hash/src/Homepage.dart';
import 'package:hash/src/interest.dart';

import 'package:hash/src/login.dart';
import 'package:hash/src/privacy.dart';
import 'package:hash/src/signup.dart';
import 'package:hash/src/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  final pv = '''
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce commodo posuere feugiat. Vestibulum vulputate orci tincidunt, sollicitudin lectus id, suscipit mauris. Donec et mauris vitae dui varius rutrum. Nulla eu lectus ipsum. Quisque rutrum non magna sit amet fringilla. Quisque id augue posuere, suscipit elit ut, bibendum libero. Proin eget vestibulum eros.

Cras fermentum venenatis sapien, sit amet egestas sapien rutrum consequat. Donec accumsan nisl id nulla porta maximus. Donec et mauris quis tellus laoreet sodales vel eu sapien. Donec pretium sodales odio, a interdum ante pharetra dignissim. Integer viverra ullamcorper ex eu faucibus. Praesent elementum ac massa ut porta. Ut ac leo id lorem fringilla varius. Curabitur dictum consequat efficitur. Aliquam lobortis maximus massa. Vivamus facilisis semper porttitor.
''';

  final tnc = '''
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce commodo posuere feugiat. Vestibulum vulputate orci tincidunt, sollicitudin lectus id, suscipit mauris. Donec et mauris vitae dui varius rutrum. Nulla eu lectus ipsum. Quisque rutrum non magna sit amet fringilla. Quisque id augue posuere, suscipit elit ut, bibendum libero. Proin eget vestibulum eros.

Cras fermentum venenatis sapien, sit amet egestas sapien rutrum consequat. Donec accumsan nisl id nulla porta maximus. Donec et mauris quis tellus laoreet sodales vel eu sapien. Donec pretium sodales odio, a interdum ante pharetra dignissim. Integer viverra ullamcorper ex eu faucibus. Praesent elementum ac massa ut porta. Ut ac leo id lorem fringilla varius. Curabitur dictum consequat efficitur. Aliquam lobortis maximus massa. Vivamus facilisis semper porttitor.
''';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hash',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/home',
      routes: {
        '/splash': (context) => Splash(),
        '/login': (context) => Login(),
        '/signup': (context) => Signup(),
        '/interest': (context) => Interest(),
        '/home': (context) => Homepage(),

        //
        '/': (context) => Privacy(title: 'Privacy Policy', body: pv),
        '/privacy': (context) => Privacy(title: 'Privacy Policy', body: pv),
        '/tnc': (context) => Privacy(title: 'Terms & Conditions', body: tnc),
      },
    );
  }
}
