import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:newproject/constants/constants.dart';
import 'package:newproject/services/assets_manager.dart';
import 'package:newproject/services/services.dart';
import 'package:newproject/widget/chat_widget.dart';
import 'package:newproject/widget/text_widget.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final bool _isTyping = true;

   late TextEditingController textEditingController;

  @override
  void initState(){
    textEditingController = TextEditingController();

    super.initState();
  }

 // @override
  // void dispose(){
  //   textEditingController = TextEditingController();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(AssetManager.botImage),
        ),
        title: Text('ChatGPT'),
        actions: [
          IconButton(onPressed: () async {
           await Services.showModalSheet(context: context);
          },
           icon: const Icon(Icons.more_vert_rounded, color: Colors.white,),
           ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index){
                  return ChatWidget(
                    msg: chatMessages[index]["msg"].toString(), 
                    ChatIndex: int.parse(
                      chatMessages[index]["ChatIndex"].toString(),
                    ));
                },
                ),
            ),
            if(_isTyping) ...[
              const SpinKitThreeBounce(
                color: Colors.white,
                size: 20.0,
              ),
              SizedBox(height: 10,),
              Material(
                color: cardColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                         style: const TextStyle(color: Colors.white), 
                           controller: textEditingController,
                          onSubmitted: (value){
                            //TODO Send Message
                          },
                         decoration: InputDecoration.collapsed(
                          hintText: "How can i help you",
                          hintStyle: TextStyle(color: Colors.white),
                          ),
                          
                        ),
                        ),
                        IconButton(onPressed: () {}, 
                        icon: const Icon(Icons.send, color: Colors.white,),
                        ),
                    ],
                  ),
                ),
              ),

            ],
          ],
        ))
    );
  }
}