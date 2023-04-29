import 'package:flutter/material.dart';
import 'package:newproject/constants/constants.dart';
import 'package:newproject/services/assets_manager.dart';
import 'package:newproject/widget/text_widget.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key, required this.msg, required this.ChatIndex});


  final String msg;
  final int ChatIndex;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: ChatIndex == 0 ? ScaffoldBackgroundColor: cardColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image.asset(
                  ChatIndex == 0 ? AssetManager.userImage:AssetManager.botImage,
                height: 30,
                width: 30,
                ),
                 Expanded(child: TextWidget(label: msg,),
                 ),
                ChatIndex == 0 ? const SizedBox.shrink()
                :Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.thumb_up_alt_outlined, color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.thumb_down_alt_outlined,
                      color: Colors.white,
                    ),
                  ],
                ) 
              ],
            ),
          ),
        )
      ],
    );
  }
}