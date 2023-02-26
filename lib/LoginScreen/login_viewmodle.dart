import 'package:chat_app/Utils/Myuser.dart';
import 'package:chat_app/Utils/data_backed.dart';
import 'package:chat_app/firebase/detabase/firebase_utils.dart';
import 'package:chat_app/Utils/importantowrds.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

abstract class login_navigator extends BaseNavigator{
}

class loginViewmodel extends BaseViewModel<login_navigator>{
  //هنا مش هعرف اعمل اوبجيكت عشان هوا اابستراكت فبعمله امليمنت هناك عشان الامبلمينتيشن متعرف هناك في ال فيو
 // late loginNavigator navigator;

  void loginfirebaseaiuth(String email,String password)async{
    try {
      navigator?.showloading();
      final rulist = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
     var user=await UitelsFirebase.getuser(rulist.user!.uid);
     if(user==null){
       navigator?.hideloading();
       navigator?.showmessage('some thing went wrong');
     }else{
       navigator?.hideloading();
       navigator?.showmessage('sucsess');
       navigator?.gohomescreen();
       SharedData.user=user;
     }
    } on FirebaseAuthException catch (e) {
      if (e.code == imp_word.usernotfound) {
        navigator?.hideloading();
        navigator?.showmessage('No user found for that email.');
        print('No user found for that email.');
      } else if (e.code == imp_word.wrongPassword) {
        navigator?.hideloading();
        navigator?.showmessage('Wrong password provided for that user.');
        print('Wrong password provided for that user.');
      }
    }

}
  void logenuser()async{
    if(FirebaseAuth.instance.currentUser!=null){
      var user=await UitelsFirebase.getuser(FirebaseAuth.instance.currentUser!.uid);
      SharedData.user=user;
      navigator!.gohomescreen();
    }
  }

}
