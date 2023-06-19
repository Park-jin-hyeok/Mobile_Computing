import 'package:flutter/material.dart';
import 'Home.dart';
import 'Research.dart';
import 'Profile.dart';
import 'Community.dart';

class MySecondPage extends StatefulWidget {
  @override
  _MySecondPageState createState() => _MySecondPageState();
}

class _MySecondPageState extends State<MySecondPage> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    ResearchPage(),
    ProfilePage(),
    CommunityPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,  // 배경색을 indigo로 설정
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Color(0xFF00233B),  // 네비게이션 바 배경색을 indigo로 설정
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,  // 아이템 위치를 고정하기 위해 fixed 타입 사용
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '홈',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: '탐색',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: '프로필',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: '커뮤니티',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
