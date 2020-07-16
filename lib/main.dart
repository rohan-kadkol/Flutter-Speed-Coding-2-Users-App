import 'package:flutter/material.dart';
import 'package:users_app/screens/home_screen.dart';

void main() {
  runApp(UsersApp());
}

class UsersApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
