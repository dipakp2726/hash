import 'package:flutter/material.dart';

class HashDrawer extends StatefulWidget {
  const HashDrawer({
    super.key,
  });

  @override
  _HashDrawerState createState() => _HashDrawerState();
}

class _HashDrawerState extends State<HashDrawer> {
  var _active = 1;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Drawer(
      child: Row(
        children: <Widget>[
          Expanded(
            //  padding: EdgeInsets.fromLTRB(18, 60, 17, 0),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.grey[100]!)],
              ),
              width: 100,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(18, 60, 17, 0),
                child: CustomScrollView(
                  semanticChildCount: 2,
                  slivers: <Widget>[
                    SliverList(
                      key: GlobalKey(),
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return _buildDrawerInnerItem(index);
                        },
                        childCount: 5,
                      ),
                    ),
                    SliverList(
                      key: GlobalKey(),
                      delegate: SliverChildListDelegate(<Widget>[
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 12),
                          padding: const EdgeInsets.all(2),
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(color: Colors.grey),
                          child: const Icon(Icons.add),
                        )
                      ]),
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
                    style: textTheme.headline2,
                  ),
                ),
                const Divider(
                  height: 1,
                  thickness: 1,
                  color: Colors.black,
                ),
                Expanded(
                  child: ListView(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    children: [
                      ListTile(
                        leading: const Icon(Icons.dashboard_outlined),
                        title: Text(
                          'Channels',
                          style: textTheme.headline4,
                        ),
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                      ListTile(
                        leading: const Icon(Icons.people_alt_outlined),
                        title: Text('Members', style: textTheme.headline4),
                      ),
                      ListTile(
                        leading: const Icon(Icons.person_add_alt),
                        title:
                            Text('Invite Members', style: textTheme.headline4),
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                      ListTile(
                        leading: const Icon(Icons.help_outline),
                        title: Text('Help', style: textTheme.headline4),
                      ),
                      ListTile(
                        leading:
                            const Icon(Icons.settings_input_component_sharp),
                        title: Text('Settings', style: textTheme.headline4),
                      ),
                      ListTile(
                        leading: const Icon(Icons.logout),
                        onTap: () =>
                            Navigator.of(context).pushNamedAndRemoveUntil(
                          '/login',
                          (Route<dynamic> route) => false,
                        ),
                        title: Text(
                          'Signout of community',
                          style: textTheme.headline4,
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

  Widget _buildDrawerInnerItem(int index) {
    return InkWell(
      onTap: () => setState(() => _active = index),
      child: Container(
        decoration: _active != index
            ? null
            : BoxDecoration(
                border: Border.all(width: 2),
              ),
        margin: const EdgeInsets.symmetric(vertical: 12),
        padding: const EdgeInsets.all(2),
        height: 65,
        width: 65,
        child: Image.asset(
          'assets/faith4.png',
          height: 50,
          width: 50,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
