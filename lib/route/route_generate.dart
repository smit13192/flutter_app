import 'package:flutter/material.dart';
import '../page/error.dart';
import '../page/home.dart';
import '../page/login.dart';

class RouteGenerater {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // settings te route name and arguments ley

    // how i pass data into the new page
    var args = settings.arguments;

    switch (settings.name) {

      // this is the login page route
      case "/":
        return MaterialPageRoute(
            builder: (context) => const LoginPage(
                  title: "this is the flutter demo",
                ));

      // this is the home page route
      case "/Home":
        // if args is string when go to home page  else goto the error page
        if (args is String) {
          return MaterialPageRoute(
              builder: (context) => HomePage(
                    name: args,
                  ));
        }
        return MaterialPageRoute(builder: (context) => const ErrorPage());

      // jo akey route no hoy te unknow route hoy to error page open thase
      default:
        return MaterialPageRoute(builder: (context) => const ErrorPage());
    }
  }
}
