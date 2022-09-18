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
  bool isNotSeen = true;

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
            Padding(
              padding: const EdgeInsets.only(bottom: 30, top: 20),
              child: Text("MS Creation",
                  style: TextStyle(
                      letterSpacing: 2,
                      fontFamily: "Lato",
                      fontSize: 30,
                      color: Colors.black12.withOpacity(0.8),
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
                    prefixIcon: Icon(Icons.email_outlined),
                    labelText: "Enter Your Email Address",
                    border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
              child: TextFormField(
                controller: _password,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.security,
                    ),
                    labelText: "Enter Your Password",
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isNotSeen = !isNotSeen;
                          });
                        },
                        icon: Icon(isNotSeen
                            ? Icons.visibility_off
                            : Icons.visibility)),
                    // OutlineInputBorder thi form field ma outline avi jay
                    border: const OutlineInputBorder()),
                obscureText: isNotSeen,
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
