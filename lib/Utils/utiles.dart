import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void showloading(BuildContext context, {String message = ''}) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actions: [
            Row(
              children: [
                CircularProgressIndicator(),
                message != ' ' ? Text(message) : Text("Loading")
              ],
            )
          ],
        );
      });
}

void hideloading(BuildContext context) {
  Navigator.pop(context);
}

void showmessage(
    {required BuildContext context,
    required String message,
    required String clicmessage,
    required Function dosome,
    String? clic2,
    Function? dosome2}) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(message),
          actions: [
            TextButton(
                onPressed: () {
                  dosome(context);
                },
                child: Text(clicmessage))
          ],
        );
      });

}
String formatdate(int date){
  DateTime dateTime=DateTime.fromMillisecondsSinceEpoch(date);
  DateFormat dateFormat=DateFormat('HH:MM aaa');
  return dateFormat.format(dateTime);
}
