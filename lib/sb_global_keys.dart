import 'package:flutter/material.dart';
import 'package:flutter_api/pages/event_show.dart';
import 'package:flutter_api/pages/my_home_page.dart';
import 'package:flutter_api/pages/login.dart';

class SbGlobalKeys {
  static GlobalKey<MyHomePageState>  homePage  = GlobalKey();
  static GlobalKey<EventShowState>   eventShow = GlobalKey();
  static GlobalKey<SbLoginState>     login     = GlobalKey();
   static GlobalKey<SbUserShowState> SbUserShow= GlobalKey();
}
