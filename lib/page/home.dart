import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String name;

  const HomePage({super.key, required this.name});

  @override
  State<HomePage> createState() => _HomePageState(name);
}

class _HomePageState extends State<HomePage> {
  final List _message = [];

  String name;

  _HomePageState(this.name);

  @override
  Widget build(BuildContext context) {
    var messageController = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Home"),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(
                        vertical: 6.0, horizontal: 10.0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 14.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            child: Text(name[0]),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    name,
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(_message[index])
                                ],
                              ),
                            ),
                          ),
                          const Icon(color: Colors.black54, Icons.person)
                        ],
                      ),
                    ),
                  );
                },
                itemCount: _message.length,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: messageController,
                      keyboardType: TextInputType.text,
                      decoration:
                          const InputDecoration(labelText: "Enter The Message"),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        _message.add(messageController.text);
                        messageController.clear();
                        setState(() {});
                      },
                      icon: const Icon(color: Colors.blueAccent, Icons.send))
                ],
              ),
            )
          ],
        ));
  }
}
