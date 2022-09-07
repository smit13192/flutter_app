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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      onGenerateRoute: RouteGenerater.generateRoute,
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Image.asset("assets/images/working.png"),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text("MS Creation",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
              child: TextFormField(
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: "Enter Your Name",
                    labelText: "Enter Your Name",
                    border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
              child: TextFormField(
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.security),
                    hintText: "Enter Your Password",
                    labelText: "Enter Your Password",
                    border: OutlineInputBorder()),
                obscureText: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
              child: ElevatedButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(vertical: 12)),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.deepPurple),
                      elevation: MaterialStateProperty.all(3)),
                  onPressed: () {
                    Navigator.of(context).pushNamed("/Home");
                  },
                  child: const Text(
                    "Log In",
                    style: TextStyle(fontSize: 20),
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Forgotten your login details? ",
                  style: TextStyle(fontSize: 12),
                ),
                InkWell(
                  child: const Text(
                    "Get help with loggin in.",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed("/error");
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
