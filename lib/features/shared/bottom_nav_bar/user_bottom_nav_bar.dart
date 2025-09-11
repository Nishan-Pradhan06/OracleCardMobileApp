import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    Center(child: Text('Home Screen')),
    Center(child: Text('Journal Screen')),
    Center(child: Text('Library Screen')),
    Center(child: Text('Session Screen')),
    Center(child: Text('Profile Screen')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: Material(
        elevation: 8,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/svg/home.svg'),
              activeIcon: SvgPicture.asset('assets/svg/home_bold.svg'),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/svg/journal.svg'),
              activeIcon: SvgPicture.asset('assets/svg/journal_bold.svg'),
              label: 'Journal',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/svg/library.svg'),
              activeIcon: SvgPicture.asset('assets/svg/library_bold.svg'),
              label: 'Library',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/svg/session.svg'),
              activeIcon: SvgPicture.asset('assets/svg/session_bold.svg'),
              label: 'Session',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/svg/profile.svg'),
              activeIcon: SvgPicture.asset('assets/svg/profile_bold.svg'),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
