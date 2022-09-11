import 'package:flutter/material.dart';
import 'package:ms_creation/utilites/drawer.dart';

import 'DashBoardPage.dart';

class HomePage extends StatelessWidget {
  final String name;
  final String email;

  const HomePage({super.key, required this.name,required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: ChatScreen(name: name),
      drawer: MyDrawer(name: name,email: email),
    );
  }
}

// ignore: must_be_immutable
class ChatScreen extends StatefulWidget {
  ChatScreen({Key? key, required this.name}) : super(key: key);
  String name;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  var messageController = TextEditingController();

  final List _message = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                // give the border radius
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 2,
                margin:
                    const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 14.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        child: Text(widget.name[0].toUpperCase(),
                            style: const TextStyle(fontSize: 20)),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.name,
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
                      const Icon(Icons.person)
                    ],
                  ),
                ),
              );
            },
            itemCount: _message.length,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 5),
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
                    setState(() {});
                  },
                  icon: const Icon(Icons.send))
            ],
          ),
        )
      ],
    );
  }
}
