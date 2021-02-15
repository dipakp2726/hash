import 'package:hash/src/values/colors.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:hash/src/Home.dart';
import 'package:hash/src/hashdrawer.dart';
import 'package:hash/src/hashtab.dart';
import 'package:hash/src/model/model.dart';
import 'package:hash/src/settings.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var _currentIndex = 0;

  final _tabs = <Widget>[Home(), HashTab(), null, Settings()];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppState>(
      create: (_) => AppState(),
      child: Scaffold(
        drawer: HashDrawer(),
        body: _tabs[_currentIndex],
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: HashFAB(),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (val) => setState(() => _currentIndex = val),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(right: 24.0),
                  child: new Image.asset('assets/hashIcon.png',
                      color: _currentIndex == 1 ? kHashBlue : Colors.black),
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: Icon(Icons.messenger_outline_outlined),
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined), label: ''),
          ],
        ),
      ),
    );
  }
}

class HashFAB extends StatelessWidget {
  const HashFAB({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, state, child) {
        return Visibility(
          visible: state.isCommnunityjoined,
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/dries.png'),
            radius: 30,
          ),
        );
      },
    );
  }
}
