import 'package:chat_app/LoginScreen/logenscreen.dart';
import 'package:chat_app/add_rome/add_rome.dart';
import 'package:chat_app/home_screen/chatThread/ChatTread.dart';
import 'package:chat_app/home_screen/homescreen.dart';
import 'package:chat_app/register/register_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      routes:{
        Add_Rome.routname:(context) => Add_Rome(),
        Registerscreen.routname:(context) => Registerscreen(),
        LoginScreen.routname:(context) => LoginScreen(),
        MyHomescreen.routname:(context) => MyHomescreen(),
        ChatTheard.RoutName:(context) => ChatTheard(),
      },
      initialRoute:LoginScreen.routname,
    );
  }

}
