import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  String name;
  HomePage({super.key,required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Home"),
      ),
      body: Center(
        child: Text("My Name Is $name"),
      ),
    );
  }
}
