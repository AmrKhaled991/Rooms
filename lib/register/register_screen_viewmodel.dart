import 'package:chat_app/Utils/Myuser.dart';
import 'package:chat_app/firebase/detabase/firebase_utils.dart';
import 'package:chat_app/firebase/model/my_user.dart';
import 'package:chat_app/Utils/importantowrds.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Utils/data_backed.dart';

abstract class register_navigator extends BaseNavigator{
}

class RegisterViewmodle extends BaseViewModel<register_navigator> {

  void registerFirebaseauth(String email, String password, String name, String lastname, String username) async {
    try {
      navigator?.showloading();
      final ruslt = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      var user = MyUser(id: ruslt.user!.uid,
          name: name,
          lastname: lastname,
          username: username,
          email: email,);
      var datauser =  await UitelsFirebase.registeruser(user);
      navigator?.hideloading();
      navigator?.showmessage('sucsess');
      navigator?.gohomescreen();
      SharedData.user=user;
    } on FirebaseAuthException catch (e) {
      if (e.code == imp_word.weakpassword) {
        navigator?.hideloading();
        navigator?.showmessage('The password provided is too weak.');
        print('The password provided is too weak.');
      } else if (e.code == imp_word.emailalreadyinuse) {
        navigator?.hideloading();
        navigator?.showmessage('The account already exists for that email.');
        print('The account already exists for that email.');
      }
    } catch (e) {
      navigator?.hideloading();
      navigator?.showmessage('something wrong');
      print(e);
    }
  }
}


