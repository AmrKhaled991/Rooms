import 'package:chat_app/Utils/Myuser.dart';
import 'package:chat_app/firebase/model/Mymessage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/Utils/utiles.dart' as Utils;
class Messageshow extends StatelessWidget {
  Message messageshow;

  Messageshow({required this.messageshow});

  Widget build(BuildContext context) {
    return SharedData.user!.name == messageshow.sendername
        ? Messagesent(
            message: messageshow,
          )
        : Messagersaved(message: messageshow);
  }
}

class Messagesent extends StatelessWidget {
  Message message;

  Messagesent({required this.message});

  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: CupertinoColors.activeBlue,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(25),
                topLeft: Radius.circular(25),
                bottomLeft: Radius.circular(25),
              )),
          child: Text(
            message.messagecontent ?? '',
            style: TextStyle(color: Colors.white),
          ),
        ),
        Text(Utils.formatdate(message.datetime!))
      ],
    );
  }
}

class Messagersaved extends StatelessWidget {
  Message message;

  Messagersaved({required this.message});

  DateTime dateTime = DateTime.now();

  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(message.sendername ?? ''),
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: CupertinoColors.systemGrey4,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(25),
                topLeft: Radius.circular(25),
                bottomLeft: Radius.circular(25),
              )),
          child: Text(
            message.messagecontent ?? '',
            style: TextStyle(color: Colors.white),
          ),
        ),
        Text(Utils.formatdate(message.datetime!))
      ],
    );
  }
}
