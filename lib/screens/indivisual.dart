import 'package:emoji_picker/emoji_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:whatsapp/model/chatmodel.dart';

class Indivisual extends StatefulWidget {
  Indivisual({Key key, this.chatModel}) : super(key: key);
  final ChatModel chatModel;

  @override
  _IndivisualState createState() => _IndivisualState();
}

class _IndivisualState extends State<Indivisual> {
  bool show = false;
  FocusNode focusNode = FocusNode();
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          show = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          leadingWidth: 70.0,
          leading: InkWell(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.arrow_back,
                  size: 24.0,
                ),
                CircleAvatar(
                  child: SvgPicture.asset(
                    widget.chatModel.isGroup
                        ? "assets/images/groups.svg"
                        : "assets/images/person.svg",
                    color: Colors.black,
                    height: 36.0,
                    width: 36.0,
                  ),
                  radius: 20.0,
                  backgroundColor: Colors.blueGrey,
                ),
              ],
            ),
          ),
          title: Container(
            // margin: EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.chatModel.name,
                  style: TextStyle(fontSize: 18.5),
                ),
                Text(
                  'last seen today time ${widget.chatModel.time}',
                  style: TextStyle(
                    fontSize: 13,
                  ),
                )
              ],
            ),
          ),
          actions: [
            IconButton(icon: Icon(Icons.videocam), onPressed: () {}),
            IconButton(icon: Icon(Icons.call), onPressed: () {}),
            PopupMenuButton<String>(
              onSelected: (value) {
                print('object');
              },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    child: Text("View contact"),
                    value: "View contact",
                  ),
                  PopupMenuItem(
                    child: Text("Meadia,links,and docs"),
                    value: "Meadia,links,and docs",
                  ),
                  PopupMenuItem(
                    child: Text("Search"),
                    value: "Search",
                  ),
                  PopupMenuItem(
                    child: Text("Mute notification"),
                    value: "Mute notification",
                  ),
                  PopupMenuItem(
                    child: Text("wallpaper"),
                    value: "wallpaper",
                  ),
                ];
              },
            )
          ],
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WillPopScope(
          child: Stack(
            children: [
              ListView(),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width - 55,
                            child: Card(
                              // color: Colors.black,
                              margin:
                                  EdgeInsets.only(left: 2, bottom: 8, right: 2),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0)),
                              child: TextFormField(
                                controller: controller,
                                focusNode: focusNode,
                                keyboardType: TextInputType.multiline,
                                // maxLength: 10,
                                minLines: 1,
                                maxLines: 10,
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                  hintText: "Type a message",
                                  contentPadding: EdgeInsets.all(5),
                                  prefixIcon: IconButton(
                                    onPressed: () {
                                      focusNode.unfocus();
                                      focusNode.canRequestFocus = false;
                                      setState(() {
                                        show = !show;
                                      });
                                    },
                                    icon: Icon(
                                      Icons.emoji_emotions,
                                    ),
                                    color: Colors.grey,
                                  ),
                                  suffixIcon: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                          icon: Icon(Icons.attach_file),
                                          onPressed: () {}),
                                      IconButton(
                                        icon: Icon(Icons.camera_alt),
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: CircleAvatar(
                              radius: 25,
                              backgroundColor: Color(0xFF075E54),
                              child: IconButton(
                                  icon: Icon(Icons.mic),
                                  color: Colors.white,
                                  onPressed: () {}),
                            ),
                          ),
                        ],
                      ),
                      show ? emojiSelect() : Container(),
                    ],
                  ))
            ],
          ),
          onWillPop: () {
            if (show) {
              setState(() {
                show = false;
              });
            } else {
              Navigator.pop(context);
            }
            return Future.value(false);
          },
        ),
      ),
    );
  }

  Widget emojiSelect() {
    return EmojiPicker(
        rows: 4,
        columns: 7,
        onEmojiSelected: (emoji, categery) {
          setState(() {
            controller.text = controller.text + emoji.emoji;
          });
        });
  }
}
