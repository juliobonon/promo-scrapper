import 'package:flutter/material.dart';
import 'package:promoscrapperUI/homePage.dart';
import 'package:promoscrapperUI/pages/accountPage.dart';
import 'package:promoscrapperUI/services/auth.dart';
import 'package:provider/provider.dart';

class PageWrapper extends StatefulWidget {
  @override
  _PageWrapperState createState() => _PageWrapperState();
}

class _PageWrapperState extends State<PageWrapper> {
  int _index = 1;
  final _pageOptions = [
    AccountPage(),
    HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Ink(
            decoration: ShapeDecoration(
              shape: CircleBorder(),
            ),
            child: IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                context.read<Auth>().signOut();
              },
            ),
          )
        ],
      ),
      body: _pageOptions[_index],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (newIndex) => setState(() => _index = newIndex),
        currentIndex: _index,
        items: [
          BottomNavigationBarItem(
            label: "Products",
            icon: Icon(Icons.loupe),
          ),
          BottomNavigationBarItem(
            label: "Account",
            icon: Icon(Icons.people),
          ),
        ],
      ),
    );
  }
}
