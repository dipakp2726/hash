import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({Key key}) : super(key: key);

  final groups = const ['general', 'random', 'daily_practice', 'dailogues'];
  final people = const [
    'Members',
    'Invite Members',
    '',
    'Privacy Policy',
    'Terms',
    'FAQ',
    'Notificatioin'
  ];

  final titlestyle = const TextStyle(
      fontSize: 18.0, color: Colors.black45, fontWeight: FontWeight.w300);

  final itemstyle =
      const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300);

  final space = const SizedBox(height: 10);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(32, 32, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage('assets/dries.png'),
              radius: 50,
            ),
            SizedBox(height: 15),
            Text(
              'Alice',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 60, 0),
              child: Text(
                'Life has a meaning but do not set out to find out. Just live it out.',
                style: TextStyle(color: Colors.black38),
              ),
            ),
            space,
            // followers section
            Row(
              children: <Widget>[
                Text('12 \n Following'),
                SizedBox(width: 20),
                Text('12 \n Followers'),
              ],
            ),

            space,

// Groups
            Text('Groups', style: titlestyle),

            ..._buildGroups(),

            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text('Add new', style: itemstyle),
            ),

            space,

            Text('People', style: titlestyle),

            ...people.map((item) => _settingsItem(item)).toList(),

            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text('Settings',
                  style:
                      TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600)),
            )
          ],
        ),
      ),
    );
  }

  Widget _settingsItem(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 6.0),
      child: Text(title, style: itemstyle),
    );
  }

  _buildGroups() {
    return groups
        .map((item) => Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text('# $item', style: itemstyle),
            ))
        .toList();
  }
}
