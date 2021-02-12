import 'package:flutter/material.dart';
import 'package:hash/src/model/model.dart';
import 'package:provider/provider.dart';

class HashTab extends StatefulWidget {
  HashTab({Key key}) : super(key: key);

  @override
  _HashTabState createState() => _HashTabState();
}

class _HashTabState extends State<HashTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 184.0,
          child: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Positioned.fill(
                child: Ink.image(
                  image: AssetImage('assets/faith.png'),
                  fit: BoxFit.cover,
                  child: Container(),
                ),
              ),
              Align(
                alignment: Alignment(-.9, -.5),
                child: IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: Icon(
                    Icons.menu,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                bottom: -35.0,
                left: 16.0,
                right: 16.0,
                child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.bottomCenter,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/dries.png'),
                      radius: 50,
                    )),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(18, 10, 18, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      SizedBox(height: 35),
                      Text(
                        'Melo drama',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  _buildJoinAndFollowers(),
                ],
              ),
              SizedBox(height: 5),
              Text(
                'Life has a meaning but do not set out to find out. Just live it out.',
                style: TextStyle(fontSize: 12.0, color: Colors.black54),
              ),
            ],
          ),
        ),

        // List with childs

        SizedBox(height: 20),

        Expanded(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return index.isEven
                      ? PostItemCard(
                          image: true,
                        )
                      : PostItemCard();
                }),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildJoinAndFollowers() {
    return Consumer<AppState>(
      builder: (_, state, child) {
        final followers = state.count;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            state.isCommnunityjoined
                ? SizedBox(
                    height: 30,
                  )
                : SizedBox(
                    height: 30,
                    child: OutlinedButton(
                      onPressed: () {
                        state.joinCommunity();
                      },
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          side: BorderSide(color: Colors.blue)),
                      child: Text('Join'),
                    ),
                  ),
            SizedBox(height: 5),
            TextButton.icon(
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.black)),
              onPressed: () {
                showBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) => HashBottomSheet());
              },
              icon: Icon(Icons.people_outline_outlined, size: 18),
              label: Text("$followers People"),
            ),
          ],
        );
      },
    );
  }
}

class HashBottomSheet extends StatelessWidget {
  const HashBottomSheet({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      height: height * 3 / 4,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: 10),
            Center(
              child: SizedBox(
                width: 76,
                child: Divider(
                  thickness: 4,
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: CustomScrollView(
                semanticChildCount: 8,
                slivers: <Widget>[
                  SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      if (index == 7) {
                        return Column(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                  color: Colors.blueAccent[100],
                                  borderRadius: BorderRadius.circular(30)),
                              child: Icon(Icons.add),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Create New',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        );
                      } else {
                        return Column(
                          children: <Widget>[
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage('assets/dries.png'),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Melo drama',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        );
                      }
                    }, childCount: 8),
                  ),
                ],
              ),
            ),
          ]),
    );
  }
}

class PostItemCard extends StatelessWidget {
  PostItemCard({Key key, this.image = false}) : super(key: key);

  final bool image;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('assets/dries.png'),
                ),
                SizedBox(width: 20),
                Text(
                  'Alce',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                children: <Widget>[
                  SizedBox(width: 5),
                  Icon(
                    Icons.access_time_rounded,
                    size: 18,
                    color: Colors.black38,
                  ),
                  SizedBox(width: 5),
                  Text("12 mins ago", style: TextStyle(color: Colors.black38)),
                ],
              ),
            ),
            if (image)
              Image(
                image: AssetImage('assets/faith.png'),
                fit: BoxFit.cover,
              ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 60, 0),
              child: Text(
                'Life has a meaning but do not set out to find out. Just live it out.',
                style: TextStyle(color: Colors.black38),
              ),
            ),
            _buildButtonRow()
          ],
        ),
      ),
    );
  }

  Row _buildButtonRow() {
    return Row(
      children: <Widget>[
        // like
        TextButton.icon(
          icon: Icon(
            Icons.thumb_up_alt_outlined,
          ),
          label: Text("12 "),
          onPressed: null,
        ),
        // comment
        TextButton.icon(
          icon: Icon(
            Icons.messenger_outline,
          ),
          label: Text("12 "),
          onPressed: null,
        ),
        // share
        IconButton(
          icon: Icon(Icons.share_outlined),
          onPressed: null,
        )
      ],
    );
  }
}
