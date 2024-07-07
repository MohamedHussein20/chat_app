import 'package:chat_app/constants.dart';
import 'package:chat_app/models/message.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatPage extends StatelessWidget {
  static String id = "ChatPage";
  final _controller = ScrollController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollection);
  TextEditingController controller = TextEditingController();

  ChatPage({super.key});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: messages.orderBy(kCreatedAt).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Message> messagesList = [];
            for (var i = 0; i < snapshot.data!.docs.length; i++) {
              messagesList.add(
                Message.fromJson(snapshot.data!.docs[i]),
              );
            }
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
                    child: ListView.builder(
                      controller: _controller,
                        itemCount: messagesList.length,
                        itemBuilder: (context, index) {
                          return ChatBubble(
                            message: messagesList[index],
                          );
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextField(
                      controller: controller,
                      onSubmitted: (value) {
                        messages.add(
                          {
                            kMessage: value,
                            kCreatedAt: DateTime.now(),
                          },
                        );
                        controller.clear();
                        _controller.animateTo(_controller.position.maxScrollExtent,
                         duration: const Duration(seconds: 1),
                          curve: Curves.fastOutSlowIn,);
                      },
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
          } else {
            return const Text('Loading');
          }
        });
  }
}
