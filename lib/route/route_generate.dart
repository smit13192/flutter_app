import 'package:flutter/material.dart';
import 'package:ms_creation/page/CartPage.dart';
import '../page/error.dart';
import '../page/home.dart';

class RouteGenerater {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // settings te route name and arguments ley

    switch (settings.name) {
      // this is the home page route
      case "/Home":
        return MaterialPageRoute(builder: (context) => const HomePage());

      case "/cart":
        return MaterialPageRoute(builder: (context) => const CartItem());

      // jo akey route no hoy te unknow route hoy to error page open thase
      default:
        return MaterialPageRoute(builder: (context) => const ErrorPage());
    }
  }
}
