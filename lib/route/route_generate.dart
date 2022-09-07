import '../page/error.dart';
import '../page/home.dart';
import '../main.dart';
import 'package:flutter/material.dart';

class RouteGenerater {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
            builder: (_) => const LoginPage(
                  title: "this is the flutter demo",
                ));

      case "/Home":
        return MaterialPageRoute(builder: (_) => const HomePage());

      default:
        return MaterialPageRoute(builder: (_) => const ErrorPage());
    }
  }
}
