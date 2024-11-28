import 'package:flutter/material.dart';
import 'package:flutter_project/shared/colors.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: Text("add post screen"),
      ),
      backgroundColor: mobileBackgroundColor,
      body: Center(
          child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.upload,
                size: 55,
              ))),
    );
  }
}
