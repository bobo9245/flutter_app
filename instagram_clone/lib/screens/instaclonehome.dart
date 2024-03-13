import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram_clone/screens/instabody.dart';

class InstaCloneHome extends StatefulWidget {
  const InstaCloneHome({super.key});

  @override
  State<InstaCloneHome> createState() => _InstaCloneHomeState();
}

class _InstaCloneHomeState extends State<InstaCloneHome> {
  late int index;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    index = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: index == 0
          ? AppBar(
              title: Text(
                'Instagram',
                style: GoogleFonts.lobsterTwo(fontSize: 28),
              ),
              centerTitle: false,
              actions: [
                IconButton(
                  onPressed: () {
                    // ignore: avoid_print
                    print('Tab Favorite');
                  },
                  icon: const Icon(Icons.favorite_outline, size: 28),
                ),
                IconButton(
                  onPressed: () {
                    // ignore: avoid_print
                    print('Tab DM');
                  },
                  icon: const Icon(CupertinoIcons.paperplane, size: 28),
                ),
              ],
            )
          : null,
      body: instaBody(index: index),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (newindex) => setState(() => index = newindex),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 28),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, size: 28),
            label: 'search',
          ),
        ],
      ),
    );
  }
}
