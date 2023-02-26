import 'dart:async';

import 'package:chat_app/home_screen/homescreen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/Utils/utiles.dart' as utiles;

abstract class BaseNavigator{
  void showloading({String message});
  void hideloading();
  void showmessage(String message,);
  void gohomescreen();
}

 class BaseViewModel<t extends BaseNavigator> extends ChangeNotifier{
   t? navigator;
}

abstract class BaseStat<t extends StatefulWidget,VM extends BaseViewModel>extends State<t> implements BaseNavigator{
  late VM viewmodel;
void initState() {
  // TODO: implement initState
  viewmodel=intitvieNaigat();
  viewmodel.navigator=this;
}
//elfark ben el abustract method & WE el method el 3adya inha btkon mengher body
VM intitvieNaigat();
  void hideloading() {
    utiles.hideloading(context);
  }

  @override
  void showloading({String message=''}) {
    utiles.showloading(context,message: message);
  }

  @override
  void showmessage(String message) {
    utiles.showmessage(context: context,message:  message,clicmessage: 'ok',dosome:(context,) {
      Navigator.pop(context);
    },
    );

  }
  @override
  void gohomescreen() {
    Timer(Duration(microseconds:5 ),(){
      Navigator.pushReplacementNamed(context,MyHomescreen.routname);
    },);
  }
}
