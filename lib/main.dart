import 'package:flutter/material.dart';
import 'pages/my_home_page.dart';
import 'pages/event_show.dart';
import 'pages/login.dart';
import 'Global.dart';
import 'sb_global_keys.dart';
import 'pages/user/sb_user_show.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/home': (context) => const MyHomePage(title: 'Flutter Demo Home Page'),
        '/event_show': (context) => const EventShow(),
        '/': (context) => const SbLogin(),
        '/user_show'    : (context) => SbUserShow( key: SbGlobalKeys.SbUserShow,)
      },
    );
  }
}
