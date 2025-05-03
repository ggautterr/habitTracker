import 'package:flutter/material.dart';
import 'package:habit_tracker/authentication/login_page.dart';
import 'package:habit_tracker/authentication/signup_page.dart';
import 'package:habit_tracker/pages/home_page.dart';
import 'package:habit_tracker/routes/app_pages.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppPages.home:
        return MaterialPageRoute(builder: (context) => HomePage());
      case AppPages.signup:
        return MaterialPageRoute(builder: (context) => SignupPage());
      case AppPages.login:
        return MaterialPageRoute(builder: (context) => LoginPage());

      default:
        return MaterialPageRoute(
          builder:
              (context) =>
                  Scaffold(body: Center(child: Text("Route not found!"))),
        );
    }
  }
}
