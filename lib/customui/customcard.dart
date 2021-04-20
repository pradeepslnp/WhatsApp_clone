import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:whatsapp/model/Chatmodel.dart';
// import 'package:whatsapp/model/chatmodel.dart';
import '../model/chatmodel.dart';
import 'package:whatsapp/screens/indivisual.dart';

class Customcard extends StatelessWidget {
  // Customcard({Key key, this.chatModel}) : super(key: key);
  // final ChatModel chatModel;

  // Customcard({this.chatModel});
  const Customcard({Key key, this.chatModel}) : super(key: key);

  final ChatModel chatModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Indivisual(chatModel: chatModel),
            ));
        print('object');
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey,
              child: SvgPicture.asset(
                chatModel.isGroup
                    ? "assets/images/groups.svg"
                    : "assets/images/person.svg",
                color: Colors.black,
                height: 36.0,
                width: 36.0,
              ),
            ),
            title: Text(
              chatModel.name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            subtitle: Row(
              children: [
                Icon(Icons.done_all),
                SizedBox(
                  width: 4.0,
                ),
                Text(
                  chatModel.currentMessages,
                  style: TextStyle(fontSize: 13),
                )
              ],
            ),
            trailing: Text(chatModel.time),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Divider(
              thickness: 1,
            ),
          )
        ],
      ),
    );
    Padding(padding: EdgeInsets.only(left: 80.0, right: 20.0));
    Divider(
      thickness: 1,
      color: Colors.red,
    );
  }
}
