import 'package:flutter/material.dart';
import 'package:hash/src/values/colors.dart';

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

  final space = const SizedBox(height: 10);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    //
    final titlestyle = textTheme.headline4.copyWith(color: kHashgrey);

    final itemstyle = textTheme.headline4;

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
              style: textTheme.headline2,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 60, 0),
              child: Text(
                'Life has a meaning but do not set out to find out. Just live it out.',
                style: textTheme.bodyText2.copyWith(color: kHashgrey),
              ),
            ),
            space,
            // followers section
            Row(
              children: <Widget>[
                Text('12 \n Following', style: textTheme.bodyText2),
                SizedBox(width: 20),
                Text('12 \n Followers', style: textTheme.bodyText2),
              ],
            ),

            space,

// Groups
            Text('Groups', style: titlestyle),

            ..._buildGroups(itemstyle),

            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text('Add new', style: itemstyle),
            ),

            space,

            Text('People', style: titlestyle),

            ...people.map((item) => _settingsItem(item, itemstyle)).toList(),

            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                'Signout',
                style: itemstyle.copyWith(fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _settingsItem(String title, TextStyle itemstyle) {
    return Padding(
      padding: const EdgeInsets.only(top: 6.0),
      child: Text(title, style: itemstyle),
    );
  }

  _buildGroups(TextStyle itemstyle) {
    return groups
        .map((item) => Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text('# $item', style: itemstyle),
            ))
        .toList();
  }
}
