// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_project/shared/colors.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    final double widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor:
          widthScreen > 600 ? webBackgroundColor : mobileBackgroundColor,
      appBar: widthScreen > 600
          ? null
          : AppBar(
              title: Text(
                "FlowSnap",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: primaryColor,
                ),
              ),
              backgroundColor: mobileBackgroundColor,
              actions: [
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.messenger_outline)),
                IconButton(onPressed: () {}, icon: Icon(Icons.logout))
              ],
            ),
      body: Container(
        decoration: BoxDecoration(
          color: mobileBackgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        margin: EdgeInsets.symmetric(vertical: 11, horizontal:widthScreen>600? widthScreen/5:0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color.fromARGB(118, 231, 231, 230),
                        ),
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage("assets/img/Me.jpg"),
                        ),
                      ),
                      SizedBox(
                        width: 17,
                      ),
                      Text(
                        "Triki Mohamed",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
                ],
              ),
            ),
            Image.network(
              "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/12/5f/d9/53.jpg",
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 0.35,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 11),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.favorite_border)),
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.comment_outlined)),
                      IconButton(onPressed: () {}, icon: Icon(Icons.send)),
                    ],
                  ),
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.bookmark_outline)),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
                width: double.infinity,
                child: Text(
                  "10 Like",
                  style: TextStyle(
                      color: const Color.fromARGB(118, 231, 231, 230),
                      fontSize: 18),
                )),
            Row(
              children: [
                SizedBox(
                  width: 9,
                ),
                Text(
                  "Triki Mohamed ",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  "Sidi bou said",
                  style: TextStyle(
                      fontSize: 18, color: Color.fromARGB(255, 189, 196, 199)),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(9),
                  child: Text(
                    "view all 100 comments",
                    style: TextStyle(
                        color: const Color.fromARGB(118, 231, 231, 230)),
                  )),
            ),
            Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 9),
                child: Text(
                  "20 June 2024",
                  style: TextStyle(
                      color: const Color.fromARGB(118, 231, 231, 230)),
                ))
          ],
        ),
      ),
    );
  }
}
