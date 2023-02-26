import 'dart:async';

import 'package:chat_app/LoginScreen/logenscreen.dart';
import 'package:chat_app/LoginScreen/login_viewmodle.dart';
import 'package:chat_app/Utils/data_backed.dart';
import 'package:chat_app/home_screen/homescreen.dart';
import 'package:chat_app/register/register_screen_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/Utils/utiles.dart' as utiles;
import 'package:provider/provider.dart';

class Registerscreen extends StatefulWidget {
  static String routname = 'register';

  @override
  State<Registerscreen> createState() => _RegisterscreenState();
}

class _RegisterscreenState extends BaseStat<Registerscreen, RegisterViewmodle> implements register_navigator {
  String? name;

  String? lastname;

  String? usrname;

  String? email;

  String? password;

  var formkey = GlobalKey<FormState>();

  bool passwordshow=false ;

  @override

  @override
  Widget build(BuildContext context) {
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
              title: Text('Register'),
              centerTitle: true,
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            body: Form(
              key: formkey,
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextFormField(
                          onChanged: (text) {
                            name = text;
                          },
                          decoration: InputDecoration(label: Text('name')),
                          validator: (value) {
                            if (value == null || value
                                .trim()
                                .isEmpty) {
                              return 'inter value';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          onChanged: (text) {
                            lastname = text;
                          },
                          decoration: InputDecoration(label: Text('lastname')),
                          validator: (value) {
                            if (value == null || value
                                .trim()
                                .isEmpty) {
                              return 'inter value';
                            }
                          },
                        ),
                        TextFormField(
                          onChanged: (text) {
                            usrname = text;
                          },
                          decoration: InputDecoration(label: Text('username')),
                          validator: (value) {
                            if (value == null || value
                                .trim()
                                .isEmpty) {
                              return 'inter value';
                            }
                          },
                        ),
                        TextFormField(
                          onChanged: (text) {
                            email = text;
                          },
                          decoration: InputDecoration(label: Text('email')),
                          validator: (value) {
                            final bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value ?? '');
                            if (value == null || value
                                .trim()
                                .isEmpty) {
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
                            if (value == null || value
                                .trim()
                                .isEmpty) {
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
                            child: Text('Creat Acount')),
                        SizedBox(height: 15),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, LoginScreen.routname);
                            },
                            child: Text('Already Have Acaount'))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onvalid() async {
    if (formkey.currentState!.validate() == true) {
      viewmodel.registerFirebaseauth(
          email ?? '', password ?? '', name!, lastname!, usrname!);
    }
  }

  @override
  RegisterViewmodle intitvieNaigat() {
    return RegisterViewmodle();
  }


}
