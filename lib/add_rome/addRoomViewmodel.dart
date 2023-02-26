import 'package:chat_app/Utils/data_backed.dart';
import 'package:chat_app/firebase/detabase/firebase_utils.dart';
import 'package:chat_app/firebase/model/myroom.dart';

abstract class Addroome_navigator extends BaseNavigator {
  void showmessagesuc(String message);

}

class AddroomeViewmodel extends BaseViewModel<Addroome_navigator> {
  void addrome(String nameconrolar,
      String desconrolar, String id) {
    try {
      navigator!.showloading(message: 'creating roome...');
      var room = MyRoom(
        id: id, name: nameconrolar , des: desconrolar,  );
      UitelsFirebase.creatroom(room);
      navigator!.hideloading();
      navigator!.showmessagesuc('room created sucssefuly');
    } catch (e) {
      navigator!.hideloading();
      navigator!.showmessage('some thing went wrong - ${e}',);
    }
  }
}