import 'package:flutter/material.dart';
import 'package:ms_creation/route/route_generate.dart';

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
      theme: ThemeData(
        iconTheme: const IconThemeData(color: Colors.purple),
        primarySwatch: Colors.purple,
      ),
      initialRoute: "/",
      onGenerateRoute: RouteGenerater.generateRoute,
    );
  }
}
