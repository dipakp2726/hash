import 'package:flutter/material.dart';

class Privacy extends StatelessWidget {
  Privacy({this.title, this.body});

  final String? title;
  final String? body;

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
                  title!,
                  style: Theme.of(context).textTheme.headline1,
                ),
              ],
            ),

            //
            SizedBox(height: 30),

            Text(
              body!,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),
    );
  }
}
