import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../widget/text_widget.dart';

class Services{
  static Future<void> showModalSheet(BuildContext context, {required BuildContext context})async{
     await showModalBottomSheet(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              )
            ),
            backgroundColor: ScaffoldBackgroundColor,
            context: context, builder: (context) {
              return Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: const [
                    Flexible(child: TextWidget(label: "Choosen Modal", fontSize: 16,)),
                  ],
                ),
              );
            });
           
  }
}


