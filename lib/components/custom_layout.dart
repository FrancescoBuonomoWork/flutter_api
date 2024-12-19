import 'package:flutter/material.dart';

class CustomLayout extends StatelessWidget {
  final Widget child;
  final String title;

  const CustomLayout({Key? key, required this.child, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Impostazioni'),
        ],
      ),
    );
  }
}