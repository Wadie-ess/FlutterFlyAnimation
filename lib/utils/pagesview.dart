import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:my_weather_app/helper/constants.dart';
import 'package:my_weather_app/screens/home_Screen/home_screen.dart';
import 'package:sizer/sizer.dart';

class PagesView extends StatefulWidget {
  const PagesView({ Key? key }) : super(key: key);

  @override
  _PagesViewState createState() => _PagesViewState();
}

class _PagesViewState extends State<PagesView> {
   int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: const <Widget>[
           HomeScreen(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        containerHeight: 8.h,
        backgroundColor: myblueColor ,
        curve: Curves.linear,
        itemCornerRadius: 20,

        
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            inactiveColor: Colors.white.withAlpha(70),
            activeColor: Colors.white.withAlpha(90),
            title: const Text('Home'),
           icon:  Icon(Icons.home , color: Colors.white.withAlpha(70),)
          ),
          BottomNavyBarItem(
            activeColor: Colors.white.withAlpha(70),
            title: const Text('search'),
        icon:  Icon(Icons.search ,color: Colors.white.withAlpha(70),)
          ),
          BottomNavyBarItem(
            activeColor: Colors.white.withAlpha(70),
            title: const Text('settings'),
            icon:  Icon(Icons.settings , color: Colors.white.withAlpha(70),)
          ),
        ],
      ),
    );
  }
}
