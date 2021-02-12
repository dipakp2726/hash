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
  var _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppState>(
      create: (_) => AppState(),
      child: Scaffold(
        drawer: HashDrawer(),
        body: HashTab(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: HashFAB(),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 20,
          currentIndex: _currentIndex,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.blue,
          onTap: (val) => setState(() => _currentIndex = val),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.message_outlined), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
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
