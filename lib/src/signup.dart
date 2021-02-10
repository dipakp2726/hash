import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool _obscureText = true;

  bool agree = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(12),
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.only(top: 40),
                height: 128,
                width: 128,
                child: Image.asset('assets/hash.png'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Sign Up',
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Your Email Address',
                ),
              ),

              SizedBox(
                height: 20.0,
              ),
              TextField(
                obscureText: _obscureText,
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
              ),

              SizedBox(
                height: 20.0,
              ),
              TextField(
                obscureText: _obscureText,
                decoration: InputDecoration(
                  hintText: 'Confirm Password',
                  suffixIcon: GestureDetector(
                    onTap: () => setState(() => _obscureText = !_obscureText),
                    child: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 20.0,
              ),

              TextField(
                decoration: InputDecoration(
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
                      child: Text(
                          'By creating account, I agree to Terms & Conditions and Privacy Policy.'),
                    ),
                  ],
                ),
              ),

              // TODO replace with Expnaded
              SizedBox(height: 50.0),
              Container(
                  width: double.infinity,
                  height: 51,
                  child: ElevatedButton(
                    onPressed: () {
                      // Respond to button press
                    },
                    child: Text(
                      'SIGN IN',
                      style: TextStyle(fontSize: 18),
                    ),
                  )),
              SizedBox(height: 10.0),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'Create new accont',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
