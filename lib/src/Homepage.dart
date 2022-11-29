import 'package:flutter/material.dart';
import 'package:hash/src/Home.dart';
import 'package:hash/src/hashdrawer.dart';
import 'package:hash/src/hashtab.dart';
import 'package:hash/src/model/model.dart';
import 'package:hash/src/settings.dart';
import 'package:hash/src/values/colors.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var _currentIndex = 0;

  final _tabs = <Widget?>[const Home(), const HashTab(), null, const Settings()];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppState>(
      create: (_) => AppState(),
      child: Scaffold(
        drawer: const HashDrawer(),
        body: _tabs[_currentIndex],
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: const HashFAB(),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (val) => setState(() => _currentIndex = val),
          items: [
            const BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: Image.asset('assets/hashIcon.png',
                      color: _currentIndex == 1 ? kHashBlue : Colors.black,),
                ),
                label: '',),
            const BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(left: 24),
                  child: Icon(Icons.messenger_outline_outlined),
                ),
                label: '',),
            const BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined), label: '',),
          ],
        ),
      ),
    );
  }
}

class HashFAB extends StatelessWidget {
  const HashFAB({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, state, child) {
        return Visibility(
          visible: state.isCommnunityjoined,
          child: const CircleAvatar(
            backgroundImage: AssetImage('assets/dries.png'),
            radius: 30,
          ),
        );
      },
    );
  }
}
