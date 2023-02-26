import 'package:chat_app/add_rome/addRoomViewmodel.dart';
import 'package:chat_app/Utils/data_backed.dart';
import 'package:chat_app/home_screen/Home_viewmodel.dart';
import 'package:chat_app/home_screen/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chat_app/Utils/utiles.dart' as utiles;

import '../Utils/roome_categorey_data.dart';

class Add_Rome extends StatefulWidget {
  static String routname = 'add';

  @override
  State<Add_Rome> createState() => _Add_RomeState();
}

class _Add_RomeState extends BaseStat<Add_Rome, AddroomeViewmodel>
    implements Addroome_navigator {
  late Roomecategory selectedmenue;

  var formkey = GlobalKey<FormState>();
  var nameconrolar = TextEditingController();
  var desconrolar = TextEditingController();

  @override
  void initState() {
    super.initState();
    selectedmenue = allcat[0];
  }

  List<Roomecategory> allcat = Roomecategory.getcategories();

  @override
  Widget build(BuildContext context) {
    var mediaquary = MediaQuery
        .of(context)
        .size;
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
              title: Text('Add Rome'),
              centerTitle: true,
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
          ),
          Card(
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.transparent)),
            margin: EdgeInsets.symmetric(
                horizontal: mediaquary.width * .1,
                vertical: mediaquary.height * .15),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Form(
                key: formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Creat New Room',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Image.asset(
                      'assets/images/group.png',
                      height: 50,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: nameconrolar,
                      validator: (value) {
                        if (value == null || value
                            .trim()
                            .isEmpty) {
                          return 'please enter name';
                        }
                      },
                      decoration:
                      InputDecoration(hintText: 'Enter Rome Name'),
                    ),
                    TextFormField(
                      controller: desconrolar,
                      validator: (value) {
                        if (value == null || value
                            .trim()
                            .isEmpty) {
                          return 'please enter descrption';
                        }
                      },
                      decoration:
                      InputDecoration(hintText: 'Enter Rome Descraption'),
                      minLines: 4,
                      maxLines: 4,
                    ),
                    DropdownButton<Roomecategory>(
                        value: selectedmenue,
                        items: allcat.map((cat) {
                          return DropdownMenuItem(
                            child: Row(
                              children: [
                                Image.asset(
                                  cat.photo,
                                  width: 48,
                                  height: 48,
                                ),
                                Text(cat.name),
                              ],
                            ),
                            value: cat,
                          );
                        }).toList(),
                        onChanged: (value) {
                          if (value == null) return;
                          setState(() {
                            selectedmenue = value;
                          });
                        }),
                    SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(15)))),
                        onPressed: () {
                          addRoom();
                        },
                        child: Text('Add Room'))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  AddroomeViewmodel intitvieNaigat() {
    return AddroomeViewmodel();
  }

  void addRoom() {
    if (formkey.currentState!.validate()) {
      viewmodel.addrome(nameconrolar.text, desconrolar.text, selectedmenue.id);
    }
  }

  @override
  void showmessagesuc(String message) {
    showDialog(context: context, builder: (context) {
      return AlertDialog(
          content: Text(message),
          actions: [
          TextButton(
          onPressed: ()
      {
        Navigator.pushReplacementNamed(context, MyHomescreen.routname);
      },
      child: Text('ok'))
      ]
      );
    },
    );
  }
}
