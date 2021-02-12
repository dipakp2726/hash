import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildHeader(),
        _searchBar(),
        Expanded(
          child: ListView.builder(
            itemCount: 20,
            padding: EdgeInsets.symmetric(horizontal: 12),
            itemBuilder: (BuildContext context, int index) {
              return CardItem();
            },
          ),
        )
      ],
    );
  }

  Container _searchBar() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search your favorite communities',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black45),
            ),
            child: IconButton(
              onPressed: null,
              icon: Icon(Icons.menu),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildHeader() {
    return Container(
      padding: EdgeInsets.fromLTRB(17, 50, 0, 0),
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(),
      ]),
      child: Text(
        'Good morning, Alce!',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  const CardItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  // TODO replace Image
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/dries.png'),
                  radius: 40,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ListTile(
                        title: Text(
                          'Melo drama',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w600),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 6.0),
                          child: Text(
                            'Life has a meaning but do not set out to find out. Just live it out.',
                            style: TextStyle(fontSize: 12.0),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          TextButton.icon(
                            icon: Icon(
                              Icons.people_outline_outlined,
                              size: 18,
                            ),
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.black87),
                            ),
                            label: Text("12 People"),
                            onPressed: null,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Respond to button press
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(horizontal: 30),
                            ),
                            child: Text('Join'),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
