import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hash/src/Homepage.dart';
import 'package:hash/src/interest.dart';
import 'package:hash/src/login.dart';
import 'package:hash/src/privacy.dart';
import 'package:hash/src/signup.dart';
import 'package:hash/src/splash.dart';
import 'package:hash/src/values/colors.dart';

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
      theme: _buildHashTheme(),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => Splash(),
        '/login': (context) => Login(),
        '/signup': (context) => Signup(),
        '/interest': (context) => Interest(),
        '/home': (context) => Homepage(),

        //

        '/privacy': (context) => Privacy(title: 'Privacy Policy', body: pv),
        '/tnc': (context) => Privacy(title: 'Terms & Conditions', body: tnc),
      },
    );
  }

  ThemeData _buildHashTheme() {
    return ThemeData(
      primaryColor: kHashBlue,
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      fontFamily: GoogleFonts.poppins().fontFamily,
      textTheme: _buildHashTexttheme(),

      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: 3,
        selectedItemColor: kHashBlue,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedIconTheme: IconThemeData(color: kHashBlue, size: 24),
        type: BottomNavigationBarType.fixed,
      ),

      bottomSheetTheme: const BottomSheetThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
      ),

      // elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kHashBlue,
        ),
      ),
    );
  }

  TextTheme _buildHashTexttheme() {
    return const TextTheme(
      button: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 18,
        color: kHashWhite,
      ),

      /// body
      bodyText1: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),

      bodyText2: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),

      ///  Headlines
      headline1: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),

      headline2: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),

      headline4: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),

      headline5: TextStyle(fontSize: 10, fontWeight: FontWeight.w300),

      headline6: TextStyle(fontSize: 9, fontWeight: FontWeight.w200),

      /// Subtitles
      subtitle2: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 18,
        color: kHashgrey,
      ),
    );
  }
}
