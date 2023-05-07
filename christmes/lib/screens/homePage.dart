import 'package:christmes/models/chatUsersModel.dart';
import 'package:christmes/screens/groupPage.dart';
import 'package:christmes/screens/personalPage.dart';
import 'package:flutter/material.dart';

import 'chatPage.dart';
import 'package:matrix/matrix.dart';
import 'package:hive/hive.dart';



class HomePage extends StatefulWidget {

  final String title = "Text";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _selectedIndex = 0;
  static List<Widget> _pages = <Widget>[
    Center(
      child: ChatPage()
    ),
    Center(
      child: GroupPage()
    ),
    Center(
      child: PersonalPage()
    ),
  ];

  void _onItemTapped(int index) {
    setState(
          () {
        _selectedIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      //  title: Text(widget.title),
      //),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.grey.shade600,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            //title: Text("Chats"),
            label: "Chats",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group_work),
            label : "Groups",

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label : "Profile",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

/*
class HomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChatPage(),

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey.shade600,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            //title: Text("Chats"),
            label: "Chats",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group_work),
            label : "Groups",

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label : "Profile",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
*/


