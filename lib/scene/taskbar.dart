import 'package:flutter/material.dart';
import 'home.dart';
import 'setting.dart';

class Taskbar extends StatefulWidget {
  const Taskbar({super.key});

  @override
  _TaskbarState createState() => _TaskbarState();
}

class _TaskbarState extends State<Taskbar> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const SettingScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: _screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home'
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Setting'
              )
            ]
        )
    );
  }
}