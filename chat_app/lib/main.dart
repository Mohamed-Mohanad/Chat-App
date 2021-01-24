import 'file:///D:/Studing/Flutter_Projects/chat_app/lib/Services/auth.dart';
import 'package:chat_app/Screens/auth_screen.dart';
import 'package:chat_app/Screens/chat_with_one_screen.dart';
import 'package:chat_app/Screens/group_chat_screen.dart';
import 'package:chat_app/Screens/home_screen.dart';
import 'package:chat_app/Screens/private_chat_screen.dart';
import 'package:chat_app/Screens/profile_screen.dart';
import 'package:chat_app/Screens/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''),
        Locale('ar', ''),
      ],
      localeResolutionCallback: (currentLocale, supported) {
        if (currentLocale != null) {
          print(currentLocale.countryCode);
          return currentLocale;
        }
        return supported.first;
      },
      theme: ThemeData(
          buttonTheme: ButtonTheme.of(context).copyWith(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          )),
      routes: {
        // '/': (context) => HomeScreen(),
        ChatScreen.routeName: (context) => ChatScreen(),
        ProfileScreen.routeName: (context) =>
            ProfileScreen(userid: FirebaseAuth.instance.currentUser.uid),
        PeopleScreen.routeName: (context) => PeopleScreen(),
        ChatWithFriend.routeName: (context) => ChatWithFriend(),
      },
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (ctx, snapshot) =>
        snapshot.hasData ? HomeScreen() : AuthScreen(),
      ),
    );
  }
}