import 'package:flutter/material.dart';
import 'package:hash/src/model/model.dart';
import 'package:hash/src/values/colors.dart';
import 'package:provider/provider.dart';

class HashTab extends StatefulWidget {
  const HashTab({super.key});

  @override
  _HashTabState createState() => _HashTabState();
}

class _HashTabState extends State<HashTab> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 184,
          child: Stack(
            // overflow: Overflow.visible,
            children: <Widget>[
              Positioned.fill(
                child: Ink.image(
                  image: const AssetImage('assets/faith.png'),
                  fit: BoxFit.cover,
                  child: Container(),
                ),
              ),
              Align(
                alignment: const Alignment(-.9, -.5),
                child: IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: const Icon(
                    Icons.menu,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),
              const Positioned(
                bottom: -35,
                left: 16,
                right: 16,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.bottomCenter,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/dries.png'),
                    radius: 50,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(18, 10, 18, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 15),
                      Text(
                        'Melo drama',
                        style: textTheme.headline2,
                      ),
                    ],
                  ),
                  _buildJoinAndFollowers(textTheme),
                ],
              ),
              Text(
                'Life has a meaning but do not set out to find out. Just live it out.',
                style: textTheme.bodyText2!.copyWith(color: kHashgrey),
              ),
            ],
          ),
        ),

        // List with childs

        const SizedBox(height: 20),

        Expanded(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return index.isEven
                      ? const PostItemCard(
                          image: true,
                        )
                      : const PostItemCard();
                }),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildJoinAndFollowers(TextTheme textTheme) {
    return Consumer<AppState>(
      builder: (_, state, child) {
        final followers = state.count;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (state.isCommnunityjoined)
              const SizedBox(
                height: 21,
              )
            else
              SizedBox(
                height: 21,
                child: OutlinedButton(
                  onPressed: () {
                    state.joinCommunity();
                  },
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      side: const BorderSide(color: Colors.blue)),
                  child: Text('Join', style: textTheme.headline5),
                ),
              ),
            // SizedBox(height: 5),
            TextButton.icon(
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.black)),
              onPressed: () {
                showBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) => const HashBottomSheet());
              },
              icon: const Icon(Icons.people_outline_rounded, size: 12),
              label: Text('$followers People', style: textTheme.headline5),
            ),
          ],
        );
      },
    );
  }
}

class HashBottomSheet extends StatelessWidget {
  const HashBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    final textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      height: height * 3 / 4,
      child: Column(
        children: [
          const SizedBox(height: 10),
          const Center(
            child: SizedBox(
              width: 76,
              child: Divider(
                thickness: 4,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: CustomScrollView(
              semanticChildCount: 8,
              slivers: <Widget>[
                SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                                  color: kHashBlue.withOpacity(.13),
                                  borderRadius: BorderRadius.circular(30)),
                              child: const Icon(Icons.add),
                            ),
                            const SizedBox(height: 10),
                            Text('Create New', style: textTheme.bodyText2),
                          ],
                        );
                      } else {
                        return Column(
                          children: <Widget>[
                            const CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage('assets/dries.png'),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Melo drama',
                              style: textTheme.bodyText2,
                            ),
                          ],
                        );
                      }
                    },
                    childCount: 8,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PostItemCard extends StatelessWidget {
  const PostItemCard({super.key, this.image = false});

  final bool image;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/dries.png'),
                ),
                const SizedBox(width: 20),
                Text('Alce', style: textTheme.headline2),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 2),
              child: Row(
                children: <Widget>[
                  const SizedBox(width: 5),
                  const Icon(
                    Icons.access_time_rounded,
                    size: 12,
                    color: Colors.black38,
                  ),
                  const SizedBox(width: 5),
                  Text('12 mins ago',
                      style: textTheme.headline6!.copyWith(color: kHashgrey)),
                ],
              ),
            ),
            if (image)
              const Image(
                image: AssetImage('assets/faith.png'),
                fit: BoxFit.cover,
              ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 60, 0),
              child: Text(
                'Life has a meaning but do not set out to find out. Just live it out.',
                style: textTheme.bodyText2!.copyWith(color: kHashgrey),
              ),
            ),
            _buildButtonRow(textTheme)
          ],
        ),
      ),
    );
  }

  Row _buildButtonRow(TextTheme textTheme) {
    return Row(
      children: <Widget>[
        // like
        TextButton.icon(
          icon: const Icon(Icons.thumb_up_alt_outlined, size: 20),
          label: Text('12', style: textTheme.bodyText2),
          onPressed: null,
        ),
        // comment
        TextButton.icon(
          icon: const Icon(Icons.messenger_outline_rounded, size: 20),
          label: Text('12 ', style: textTheme.bodyText2),
          onPressed: null,
        ),
        // share
        const IconButton(
          icon: Icon(Icons.share_outlined, size: 20),
          onPressed: null,
        )
      ],
    );
  }
}
