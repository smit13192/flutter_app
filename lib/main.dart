import 'package:flutter/material.dart';
import 'package:ms_creation/route/route_generate.dart';
import 'package:ms_creation/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MS Creation',
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: "/Home",
      onGenerateRoute: RouteGenerater.generateRoute,
    );
  }
}
