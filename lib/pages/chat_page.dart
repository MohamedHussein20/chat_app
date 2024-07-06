import 'package:chat_app/constants.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  static String id = "ChatPage";

  const ChatPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              kLogo,
              height: 50,
            ),
            const Text(
              ' Chat',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(itemBuilder: (context, index) {
              return const ChatBubble();
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              cursorColor: kPrimaryColor,
              decoration: InputDecoration(
                hintText: 'Type a message',
                suffixIcon: const Icon(
                  Icons.send,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
