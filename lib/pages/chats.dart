import 'package:flutter/material.dart';
// import 'package:whatsapp/model/Chatmodel.dart';
import '../customui/customcard.dart';
import '../model/chatmodel.dart';

class Chat extends StatefulWidget {
  Chat({Key key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  List<ChatModel> chats = [
    ChatModel(
        name: "pradeep",
        isGroup: false,
        currentMessages: "hi macha",
        time: "12.45",
        icon: "person.svg"),
    ChatModel(
        name: "shashi",
        isGroup: false,
        currentMessages: "yel edya macha",
        time: "2.45",
        icon: "person.svg"),
    ChatModel(
        name: "vinod",
        isGroup: false,
        currentMessages: "hi lowda",
        time: "12.45",
        icon: "person.svg"),
    ChatModel(
        name: "oorbaglu",
        isGroup: true,
        currentMessages: "hi shata",
        time: "12.45",
        icon: "groups.svg"),
    ChatModel(
        name: "prasad",
        isGroup: false,
        currentMessages: "hi macha",
        time: "12.45",
        icon: "person.svg")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.chat),
        onPressed: () {},
      ),
      // body: ListView.builder(
      //     itemBuilder: (BuildContext context, int index) =>
      //         Customcard (chatModel: chats[index])),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) => Customcard(
          chatModel: chats[index],
        ),
      ),
    );
  }
}
