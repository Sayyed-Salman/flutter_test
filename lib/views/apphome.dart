import 'package:chat_application/helper/authenticate.dart';
import 'package:chat_application/services/auth.dart';
import 'package:chat_application/views/search.dart';
import 'package:flutter/material.dart';

class ChatHome extends StatefulWidget {
  const ChatHome({Key? key}) : super(key: key);

  @override
  State<ChatHome> createState() => _ChatHomeState();
}

class _ChatHomeState extends State<ChatHome> {
  AuthMethods authMethods = AuthMethods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FireChat"),
        actions: [
          GestureDetector(
            onTap: () {
              authMethods.signOut();
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Authenticate()));
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Icon(Icons.exit_to_app),
            ),
          )
        ],
      ),
      body: const Center(child: Text("App Home")),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.search),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SearchScreen()));
          }),
    );
  }
}
