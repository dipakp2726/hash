import 'package:flutter/material.dart';

class Privacy extends StatelessWidget {
  Privacy({this.title, this.body});

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(32, 44, 37, 0),
        child: Column(
          children: <Widget>[
            // SizedBox(height: 80),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                Text(
                  title,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
              ],
            ),

            //
            SizedBox(height: 30),

            Text(
              body,
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
