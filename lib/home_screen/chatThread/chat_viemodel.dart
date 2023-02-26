import 'package:chat_app/Utils/Myuser.dart';
import 'package:chat_app/Utils/data_backed.dart';
import 'package:chat_app/firebase/detabase/firebase_utils.dart';
import 'package:chat_app/firebase/model/Mymessage.dart';
import 'package:chat_app/firebase/model/myroom.dart';

abstract class chat_navigator extends BaseNavigator {
  void clearform();
}

class chatviewmodel extends BaseViewModel<chat_navigator> {

  void sendmessage(String text,MyRoom room) {
    var message = Message(messagecontent: text,
        datetime: DateTime.now().millisecondsSinceEpoch
      ,
        roomid:room.idfirebase ,
        sendername: SharedData.user!.name,
        );
        UitelsFirebase.sendmessage(message).then((value)
        {
          navigator!.clearform();
        }).onError((error, stackTrace) {
           navigator?.showmessage('somthing went wronge');
        });
  }

}