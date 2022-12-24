import 'package:flutter/material.dart';
import './result.dart';
import './NEBresult.dart';
import './profile.dart';

class Content extends StatefulWidget {
  const Content({Key? key}) : super(key: key);

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  int _currentIndex = 0;

  final List<Widget> _page = [
    Result(),
    NebResult(),
    Profile(),
  ];

  void updateIndex(int value) {
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: updateIndex,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.white70,
        selectedFontSize: 12,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.ten_k_outlined),
            label: "SEE",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.twelve_mp),
            label: "NEB",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
      appBar: AppBar(
        title: const Text(
          "ResNep",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: _page[_currentIndex],
    );
  }
}
