import 'package:flutter/material.dart';
import 'package:hash/src/values/colors.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final subtitle2 = Theme.of(context).textTheme.subtitle2;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: SizedBox(
          height: height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: 40),
              Center(
                child: Image.asset(
                  'assets/hash.png',
                  height: 128,
                  width: 128,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Sign In',
                    style: Theme.of(context).textTheme.headline1),
              ),
              SizedBox(height: 20.0),
              TextField(
                decoration: InputDecoration(
                    hintText: 'Your Email Address', hintStyle: subtitle2),
              ),
              SizedBox(height: 20.0),
              TextField(
                obscureText: _obscureText,
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: subtitle2,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    child: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  'Forget password?',
                  style: subtitle2.copyWith(color: kHashBlue),
                ),
              ),
              Spacer(),
              Container(
                  width: double.infinity,
                  height: 51,
                  child: ElevatedButton(
                    onPressed: () {
                      // Respond to button press
                      Navigator.pushReplacementNamed(context, '/interest');
                    },
                    child: Text(
                      'SIGN IN',
                      style: TextStyle(fontSize: 18),
                    ),
                  )),
              SizedBox(height: 10.0),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child: Center(
                  child: Text(
                    'Create new accont',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
  }
}
