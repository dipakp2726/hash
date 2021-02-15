import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hash/src/values/colors.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool _obscureText = true;

  bool agree = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    final subtitle2 = Theme.of(context).textTheme.subtitle2;
    final underlineStyle =
        TextStyle(decoration: TextDecoration.underline, color: kHashBlue);

    //
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: SizedBox(
          height: height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: 40),
              Image.asset(
                'assets/hash.png',
                height: 128,
                width: 128,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Sign Up',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              TextField(
                decoration: InputDecoration(
                    hintText: 'Your Email Address', hintStyle: subtitle2),
              ),
              SizedBox(height: 20.0),
              TextField(
                obscureText: _obscureText,
                decoration:
                    InputDecoration(hintText: 'Password', hintStyle: subtitle2),
              ),
              SizedBox(height: 20.0),
              TextField(
                obscureText: _obscureText,
                decoration: InputDecoration(
                  hintText: 'Confirm Password',
                  hintStyle: subtitle2,
                  suffixIcon: GestureDetector(
                    onTap: () => setState(() => _obscureText = !_obscureText),
                    child: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              TextField(
                decoration: InputDecoration(
                  hintStyle: subtitle2,
                  hintText: 'Your Email Address',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: <Widget>[
                    Checkbox(
                      onChanged: (_) {
                        setState(() {
                          agree = !agree;
                        });
                      },
                      value: agree,
                    ),
                    Flexible(
                      child: RichText(
                        text: TextSpan(
                          text: 'By creating account, I agree to ',
                          style: TextStyle(color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Terms & Conditions ',
                                style: underlineStyle,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(context, '/tnc');
                                  }),
                            TextSpan(text: ' and  '),
                            TextSpan(
                                text: 'Privacy Policy',
                                style: underlineStyle,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(context, '/privacy');
                                  }),
                          ],
                        ),
                      ),
                    ),
                  ],
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
                      'SIGN UP',
                      style: TextStyle(fontSize: 18),
                    ),
                  )),
              SizedBox(height: 10.0),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Sign in to existing account',
                  style: Theme.of(context).textTheme.headline2,
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
