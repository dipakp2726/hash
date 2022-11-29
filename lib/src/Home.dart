import 'package:flutter/material.dart';
import 'package:hash/src/values/colors.dart';

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: <Widget>[
        _buildHeader(textTheme),
        _searchBar(textTheme),
        Expanded(
          child: ListView.builder(
            itemCount: 20,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemBuilder: (BuildContext context, int index) {
              return const CardItem();
            },
          ),
        )
      ],
    );
  }

  Container _searchBar(TextTheme textTheme) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: SizedBox(
              height: 37,
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Search your favorite communities',
                    hintStyle: textTheme.bodyText1!.copyWith(color: kHashgrey),
                    prefixIcon: const Icon(Icons.search),
                    border: const OutlineInputBorder(),
                    contentPadding: const EdgeInsets.only(top: 5),),
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Container(
            height: 37,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: Colors.black45,
              ),
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(TextTheme textTheme) {
    return Container(
      padding: const EdgeInsets.fromLTRB(17, 50, 0, 0),
      height: 100,
      width: double.infinity,
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(),
      ],),
      child: Text(
        'Good morning, Alce!',
        style: textTheme.headline1,
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final texttheme = Theme.of(context).textTheme;
    return Card(
      shape: const RoundedRectangleBorder(),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: <Widget>[
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/dries.png'),
                  radius: 37,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ListTile(
                        title: Text(
                          'Melo drama',
                          style: texttheme.headline2,
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 1),
                          child: Text(
                            'Life has a meaning but do not set out to find out. Just live it out.',
                            style:
                                texttheme.bodyText2!.copyWith(color: kHashgrey),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          TextButton.icon(
                            icon: const Icon(
                              Icons.people_outline_rounded,
                              size: 12,
                            ),
                            style: ButtonStyle(
                              foregroundColor:
                                  MaterialStateProperty.all<Color>(kHashBlack),
                            ),
                            label:
                                Text('12 People', style: texttheme.headline5),
                            onPressed: null,
                          ),
                          SizedBox(
                            height: 21,
                            width: 67,
                            child: ElevatedButton(
                              onPressed: () {
                                // Respond to button press
                              },
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                              ),
                              child: Text(
                                'Join',
                                style: texttheme.headline5!
                                    .copyWith(color: kHashWhite),
                              ),
                            ),
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
