import 'package:flutter/material.dart';
import 'package:taskman/screens/home.dart';
import 'package:taskman/screens/signup.dart';
import 'package:taskman/screens/task_page.dart';
// import 'package:taskman/test.dart';
// import 'package:taskman/screens/task_screen.dart';
// import 'screens/test2.dart';
// import 'screens/splash.dart';
// import 'screens/onboarding.dart';
// import 'screens/login.dart';

void main(List<String> args) {
  runApp(const TaskManagerApp());
}

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: 'Nunito',
          iconTheme: const IconThemeData(color: Colors.white)),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
