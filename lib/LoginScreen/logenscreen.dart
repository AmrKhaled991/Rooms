import 'dart:async';
import 'package:chat_app/LoginScreen/login_viewmodle.dart';
import 'package:chat_app/Utils/data_backed.dart';
import 'package:chat_app/home_screen/homescreen.dart';
import 'package:chat_app/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/Utils/utiles.dart' as utiles;
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static String routname = 'name12';

  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseStat<LoginScreen,loginViewmodel> implements login_navigator {
  var formkey = GlobalKey<FormState>();

  String? email;

  String? password;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  bool passwordshow= true;

  Widget build(BuildContext context) {
    viewmodel.logenuser();
    return ChangeNotifierProvider(
      create: (context) => viewmodel,
      child: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          Image.asset('assets/images/photo1.png'),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Text('Login'),
              centerTitle: true,
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            body: Form(
              key: formkey,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      onChanged: (text) {
                        email = text;
                      },
                      decoration: InputDecoration(label: Text('email')),
                      validator: (value) {
                        final bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value ?? '');
                        if (value == null || value.trim().isEmpty) {
                          return 'inter value';
                        }
                        if (!emailValid) {
                          return 'plz enter valid email';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      obscureText: passwordshow,
                      onChanged: (text) {
                        password = text;
                      },
                      decoration: InputDecoration(label: Text('password'),
                          suffixIcon: IconButton(
                            icon: Icon(passwordshow? Icons.visibility_off:Icons.visibility),
                            onPressed: () {
                              setState(() {
                                passwordshow = !passwordshow;
                              });
                            },)),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'enter value';
                        }
                        if (value.length < 6) {
                          return 'password unvalid';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          onvalid();
                        },
                        child: Text('login')),
                    SizedBox(height: 15),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, Registerscreen.routname);
                        },
                        child: Text('Creat Acaount'))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void onvalid() {
    if (formkey.currentState!.validate()) {
      viewmodel.loginfirebaseaiuth(email ?? '', password ?? '');
    }
  }

  @override
  loginViewmodel intitvieNaigat() {
    return loginViewmodel();
  }

}
