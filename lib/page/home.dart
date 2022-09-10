import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String name;

  const HomePage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Home"),
        ),
        body: ChatScreen(name: name));
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
                        child: Text(widget.name[0],
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
                    setState(() {});
                  },
                  icon: const Icon(color: Colors.blueAccent, Icons.send))
            ],
          ),
        )
      ],
    );
  }
}
