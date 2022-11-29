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
    final height = MediaQuery.of(context).size.height;

    final subtitle2 = Theme.of(context).textTheme.subtitle2;
    const underlineStyle =
        TextStyle(decoration: TextDecoration.underline, color: kHashBlue);

    //
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: SizedBox(
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              Image.asset(
                'assets/hash.png',
                height: 128,
                width: 128,
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Sign Up',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Your Email Address',
                  hintStyle: subtitle2,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                obscureText: _obscureText,
                decoration:
                    InputDecoration(hintText: 'Password', hintStyle: subtitle2),
              ),
              const SizedBox(height: 20),
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
              const SizedBox(height: 20),
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
                          style: const TextStyle(color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Terms & Conditions ',
                              style: underlineStyle,
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(context, '/tnc');
                                },
                            ),
                            const TextSpan(text: ' and  '),
                            TextSpan(
                              text: 'Privacy Policy',
                              style: underlineStyle,
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(context, '/privacy');
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 51,
                child: ElevatedButton(
                  onPressed: () {
                    // Respond to button press
                    Navigator.pushReplacementNamed(context, '/interest');
                  },
                  child: const Text(
                    'SIGN UP',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Sign in to existing account',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
