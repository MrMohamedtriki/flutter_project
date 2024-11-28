// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_project/shared/colors.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final double widthScreen = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: Text("Layla hasan"),
      ),
      backgroundColor: mobileBackgroundColor,
      body: Column(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 22),
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
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text("1",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22)),
                        Text(
                          "Posts",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.grey),
                        )
                      ],
                    ),
                    SizedBox(width: 10),
                    Column(
                      children: [
                        Text("8",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22)),
                        Text(
                          "Followers",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.grey),
                        )
                      ],
                    ),
                    SizedBox(width: 10),
                    Column(
                      children: [
                        Text("15",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22)),
                        Text(
                          "Following",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.grey),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(15, 15, 0, 0),
              child: Text("Cute")),
          SizedBox(
            height: 10,
          ),
          Divider(
            color: Colors.white,
            thickness: widthScreen > 600 ? 0.08 : 0.44,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                label: Text(
                  "Edit profile",
                  style: TextStyle(fontSize: 17, color: primaryColor),
                ),
                icon: Icon(Icons.edit, color: Colors.grey),
                style: ButtonStyle(
                  padding: WidgetStatePropertyAll(
                    EdgeInsets.symmetric(vertical: widthScreen>600?20:10,horizontal: 33)
                  ),
                    backgroundColor: WidgetStateProperty.all(
                        const Color.fromARGB(0, 25, 171, 171)),
                    shape: WidgetStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7))),
                    side: WidgetStateProperty.all(BorderSide(
                        color: const Color.fromARGB(255, 109, 102, 102)))),
              ),
              SizedBox(
                width: 15,
              ),
              ElevatedButton.icon(
                onPressed: () {},
                label: Text(
                  "Log out",
                  style: TextStyle(fontSize: 17, color: primaryColor),
                ),
                icon: Icon(Icons.logout, color: Colors.grey),
                style: ButtonStyle(
                    padding: WidgetStatePropertyAll(
                    EdgeInsets.symmetric(vertical: widthScreen>600?20:10,horizontal: 33)
                  ),
                    backgroundColor: WidgetStateProperty.all(
                        const Color.fromARGB(255, 182, 21, 21)),
                    shape: WidgetStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7))),
                    side: WidgetStateProperty.all(BorderSide(
                        color: const Color.fromARGB(255, 109, 102, 102)))),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            color: Colors.white,
            thickness: widthScreen > 600 ? 0.08 : 0.44,
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Padding(

              padding: widthScreen>600?   const EdgeInsets.all(55.0):const EdgeInsets.all(3.0),
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, //zouz 3l mi7war el x
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing:
                        10, //el masafa el farga binathom eli 3la ajnab
                    mainAxisSpacing:
                        33, //el masafa el farga binathom ama men lowta wo fo9 binattthom
                  ),
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/12/5f/d9/53.jpg",
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
