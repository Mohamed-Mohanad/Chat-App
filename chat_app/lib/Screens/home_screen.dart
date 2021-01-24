import 'package:chat_app/Screens/group_chat_screen.dart';
import 'package:chat_app/Screens/private_chat_screen.dart';
import 'package:chat_app/Widgets/build_app_bar.dart';
import 'package:chat_app/Widgets/build_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userid = FirebaseAuth.instance.currentUser.uid;
    return SafeArea(
      child: Scaffold(
          appBar: buildAppBar(context, userid),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BuildCard('images/group.png', 'Group Chat', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatScreen()),
                );
              }),
              BuildCard('images/one_to_one.png', 'Private Chat', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PeopleScreen()),
                );
              }),
            ],
          )),
    );
  }
}
