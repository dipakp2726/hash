import 'package:flutter/material.dart';
import 'package:hash/src/values/colors.dart';

class Interest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var pickup = [
      'News',
      'Entertainment',
      'Baking',
      'Agriculter',
      'yoga',
      'baking',
      'chess',
      'Langauge',
      'archerry',
      'yoga',
      'yoga',
      'Theater',
      'Networking and Events',
      'Networking and Events',
      'Networking and Events',
      'chess',
      'Langauge',
      'Networking and Events',
      'Networking and Events',
      'Networking and Events',
      'Entertainment',
      'Baking',
      'Agriculter',
      'Networking and Events',
      'photography',
      'sketch',
      'art',
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 40),
            Center(
              child: Image.asset(
                'assets/hash.png',
                height: 128,
                width: 128,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Pick your interests',
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(height: 10),
            Text(
              'To know yourself better, we need to know your interests. Please select atleast 3 topics.',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: kHashgrey),
            ),
            SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Wrap(
                    spacing: 8.0, // gap between adjacent chips
                    runSpacing: 4.0,
                    children: pickup
                        .map((title) => InterestChip(title: title))
                        .toList()),
              ),
            ),
            SizedBox(height: 60),
          ],
        ),
      ),
      floatingActionButton: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.only(left: 30),
          width: double.infinity,
          height: 51,
          child: ElevatedButton(
            onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
            child: Text(
              'Next',
              style: TextStyle(fontSize: 18),
            ),
          )),
    );
  }
}

class InterestChip extends StatefulWidget {
  InterestChip({Key? key, this.title}) : super(key: key);

  final String? title;
  @override
  _InterestChipState createState() => _InterestChipState();
}

class _InterestChipState extends State<InterestChip> {
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    final subtitle2 = Theme.of(context).textTheme.subtitle2;
    return ChoiceChip(
      label: Text(
        widget.title!,
        style: !_selected ? subtitle2 : subtitle2!.copyWith(color: kHashWhite),
      ),
      onSelected: (_) => setState(() => _selected = !_selected),
      selected: _selected,
      selectedColor: kHashBlue,
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      shape: RoundedRectangleBorder(),
    );
  }
}
