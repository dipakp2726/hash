import 'package:flutter/material.dart';
import 'package:hash/src/Home.dart';
import 'package:hash/src/hashtab.dart';
import 'package:hash/src/settings.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HashDrawer(),
      body: HashTab(),
      bottomNavigationBar: BottomNavigationBar(
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
    );
  }
}

class HashDrawer extends StatelessWidget {
  HashDrawer({
    Key key,
  }) : super(key: key);

  var _active = 1;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Drawer(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  boxShadow: [BoxShadow(color: Colors.grey[200])]),
              width: 100,
              child: Expanded(
                child: CustomScrollView(
                  
                  slivers: <Widget>[
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        return _buildDrawerInnerItem(index);
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 150, 0, 0),
                  child: Text(
                    'Melo Drama',
                    style: textTheme.headline5,
                  ),
                ),
                Divider(
                  height: 1,
                  thickness: 1,
                  color: Colors.black,
                ),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    children: [
                      ListTile(
                        leading: Icon(Icons.dashboard_outlined),
                        title: Text('Channels'),
                      ),
                      Divider(
                        thickness: 2,
                      ),
                      ListTile(
                        leading: Icon(Icons.people_alt_outlined),
                        title: Text('Members'),
                      ),
                      ListTile(
                        leading: Icon(Icons.person_add_alt),
                        title: Text('Invite Members'),
                      ),
                      Divider(
                        thickness: 2,
                      ),
                      ListTile(
                        leading: Icon(Icons.help_outline),
                        title: Text('Help'),
                      ),
                      ListTile(
                        leading: Icon(Icons.settings_input_component_sharp),
                        title: Text('Settings'),
                      ),
                      ListTile(
                        leading: Icon(Icons.logout),
                        title: Text(
                          'Signout of community',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _buildDrawerInnerItem(int index) {
    return Container(
        decoration: _active != index
            ? null
            : BoxDecoration(border: Border.all(color: Colors.black, width: 2)),
        margin: EdgeInsets.symmetric(vertical: 12),
        padding: EdgeInsets.all(2),
        height: 50,
        width: 50,
        child: Image.asset(
          'assets/faith4.png',
          fit: BoxFit.fill,
        ));
  }
}
