import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _namecontroler = TextEditingController();
  final _emailcontroller = TextEditingController();
  final _password = TextEditingController();

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
              padding: EdgeInsets.only(bottom: 20),
              child: Text("MS Creation",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
              child: TextFormField(
                // this is controller to controlle to the formfield value
                controller: _namecontroler,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: "Enter Your Name",
                    border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
              child: TextFormField(
                // this is controller to controlle to the formfield value
                controller: _emailcontroller,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: "Enter Your Email Address",
                    border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
              child: TextFormField(
                controller: _password,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.security,
                    ),
                    labelText: "Enter Your Password",
                    // OutlineInputBorder thi form field ma outline avi jay
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
                      elevation: MaterialStateProperty.all(3)),

                  // controller_name.text thi controler no text lay sakiye
                  onPressed: () => Navigator.pushNamed(context, "/Home",
                          arguments: [
                            _namecontroler.text,
                            _emailcontroller.text,
                            _password.text
                          ]),
                  child: const Text(
                    "Log In",
                    style: TextStyle(fontSize: 20),
                  )),
            ),
            InkWell(
              child: const Text(
                "Get help with logging in.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              onTap: () => Navigator.pushNamed(context, "/error"),
            ),
          ],
        ),
      ),
    );
  }
}
