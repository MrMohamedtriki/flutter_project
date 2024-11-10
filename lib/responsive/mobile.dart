// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_label, dead_code

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/screens/add_post.dart';
import 'package:flutter_project/screens/home.dart';
import 'package:flutter_project/screens/profile.dart';
import 'package:flutter_project/screens/search.dart';
import 'package:flutter_project/shared/colors.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({super.key});

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  final PageController _pageController = PageController();

  @override
void dispose() {
   _pageController.dispose();
   super.dispose();
}
int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('mobile screen'),
      ),
      //   bottomNavigationBar:
      // BottomNavigationBar(items: [
      //   BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
      //   BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
      // ]),

      bottomNavigationBar: CupertinoTabBar(
          backgroundColor: mobileBackgroundColor,
          onTap: (index) {
            // print("------------------$index");
            setState(() {
              currentPage = index;
            });
            _pageController.jumpToPage(index);
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: currentPage==0 ? primaryColor:secondaryColor,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  color: currentPage==1 ? primaryColor:secondaryColor,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.add_circle,
                  color: currentPage==2 ? primaryColor:secondaryColor,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                  color: currentPage==3 ? primaryColor:secondaryColor,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: currentPage==4 ? primaryColor:secondaryColor,
                ),
                label: ''),
          ]),
      
      body: PageView(
        // onPageChanged: (index){
        //  print("index is $index");},
              // physics: NeverScrollableScrollPhysics(),
              controller: _pageController,
              children: [
                home(),
                Search(),
                AddPost(),
                Center(child: Text("love u ")),
                Profile(),
              ],

      ),
      
  
    );

  }
}
