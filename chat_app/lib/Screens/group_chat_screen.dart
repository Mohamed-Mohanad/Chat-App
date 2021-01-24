import 'package:chat_app/Services/constans.dart';
import 'package:chat_app/Widgets/build_list_of_message.dart';
import 'package:chat_app/Widgets/send_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  static String routeName = 'chatScreen';
  final userid = FirebaseAuth.instance.currentUser.uid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff060930),
        centerTitle: true,
        title: Text(
          'Group Chat',
          style: KStyle.copyWith(color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: BuildListOfMessegs('newchats'),
          ),
          SendMessege(userid, 'newchats'),
        ],
      ),
    );
  }
}
