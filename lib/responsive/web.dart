import 'package:flutter/material.dart';
import 'package:flutter_project/screens/add_post.dart';
import 'package:flutter_project/screens/home.dart';
import 'package:flutter_project/screens/profile.dart';
import 'package:flutter_project/screens/search.dart';
import 'package:flutter_project/shared/colors.dart';

class WebScreen extends StatefulWidget {
  const WebScreen({super.key});

  @override
  State<WebScreen> createState() => _WebScreenState();
}

class _WebScreenState extends State<WebScreen> {
  final PageController _pageController = PageController();
  int currentposition = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              _pageController.jumpToPage(0);
              setState(() {
                currentposition = 0;
              });
            },
            icon: Icon(Icons.home),
            color: currentposition == 0 ? primaryColor : secondaryColor,
          ),
          IconButton(
            onPressed: () {
              _pageController.jumpToPage(1);
              setState(() {
                currentposition = 1;
              });
            },
            icon: Icon(Icons.search),
            color: currentposition == 1 ? primaryColor : secondaryColor,
          ),
          IconButton(
            onPressed: () {
              _pageController.jumpToPage(2);
              setState(() {
                currentposition = 2;
              });
            },
            icon: Icon(Icons.camera_alt),
            color: currentposition == 2 ? primaryColor : secondaryColor,
          ),
          IconButton(
            onPressed: () {
              setState(() {
                currentposition = 3;
              });
              _pageController.jumpToPage(3);
            },
            icon: Icon(Icons.favorite),
            color: currentposition == 3 ? primaryColor : secondaryColor,
          ),
          IconButton(
            onPressed: () {
              _pageController.jumpToPage(4);
              setState(() {
                currentposition = 4;
              });
            },
            icon: Icon(Icons.person),
            color: currentposition == 4 ? primaryColor : secondaryColor,
          ),
        ],
        backgroundColor: mobileBackgroundColor,
        title: Text("FlowSnap",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40,
              color: primaryColor,
            )),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (djaja) {
          print("el index howa $djaja");
        },
        physics: NeverScrollableScrollPhysics(),
        // controller: _pageController,
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
