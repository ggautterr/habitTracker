import 'package:flutter/material.dart';
<<<<<<< Updated upstream
import 'package:habit_tracker/authentication/signup_page.dart';
=======
import 'package:habit_tracker/home_page.dart';
>>>>>>> Stashed changes

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
<<<<<<< Updated upstream
      home: Scaffold(
        body: Center(
          child: SignupPage(),
        ),
      ),
=======
      home: HomePage(),
>>>>>>> Stashed changes
    );
  }
}
