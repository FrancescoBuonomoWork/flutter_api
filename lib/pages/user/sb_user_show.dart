import 'package:flutter/material.dart';
import '../../Style.dart';

class SbUserShow extends StatefulWidget {
  const SbUserShow({super.key});
  @override
  State<SbUserShow> createState() => SbUserShowState();
}

class SbUserShowState extends State<SbUserShow> {
 @override
  Widget build(BuildContext context) {
    return layout(
      context,
      Container(
        color: Colors.blue,
      )
    );
  }
}
