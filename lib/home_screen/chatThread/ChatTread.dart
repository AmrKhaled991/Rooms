import 'package:chat_app/Utils/data_backed.dart';
import 'package:chat_app/firebase/detabase/firebase_utils.dart';
import 'package:chat_app/firebase/model/myroom.dart';
import 'package:chat_app/home_screen/chatThread/chat_viemodel.dart';
import 'package:chat_app/home_screen/chatThread/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../firebase/model/Mymessage.dart';

class ChatTheard extends StatefulWidget {
  static String RoutName = 'rout';

  @override
  State<ChatTheard> createState() => _ChatTheardState();
}

class _ChatTheardState extends BaseStat<ChatTheard, chatviewmodel>
    implements chat_navigator {
  var conrollermessage = TextEditingController();

  @override
  chatviewmodel intitvieNaigat() {
    // TODO: implement intitvieNaigat
    return chatviewmodel();
  }

  late MyRoom room;

  Widget build(BuildContext context) {
    var mediaquary = MediaQuery.of(context).size;
    room = ModalRoute.of(context)?.settings.arguments as MyRoom;
    return Stack(
      children: [
        Container(
          color: Colors.white,
        ),
        Image.asset('assets/images/photo1.png'),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(room.name),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            margin: EdgeInsets.only(top: 50, left: 12, right: 15, bottom: 12),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  StreamBuilder<QuerySnapshot<Message>>(
                    stream:
                        UitelsFirebase.getmessagesroom(room.idfirebase ?? '')
                            .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      }
                      if (snapshot.hasError){
                        return Center(
                          child: Column(
                            children: [
                              Text('somthing went wrong'),
                              ElevatedButton(
                                  onPressed: () {
                                    setState(() {});
                                  },
                                  child: Text('refresh'))
                            ],
                          ),
                        );
                      }
                      var data =
                          snapshot.data?.docs.map((e) => e.data()).toList();
                      return Expanded(
                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              return Messageshow(messageshow: data[index]);
                            },
                            reverse: true,
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 10,
                              );
                            },
                            itemCount: data!.length),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: conrollermessage,
                            decoration: InputDecoration(
                                hintText: 'Type your message',
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 2),
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(12)))),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        InkWell(
                          onTap: () {
                            sendmessage();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              color: Colors.blue,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(13),
                              child: Row(
                                children: [
                                  Text('send',
                                      style: TextStyle(color: Colors.white)),
                                  Icon(
                                    Icons.send,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  void clearform() {
    conrollermessage.clear();
    setState(() {});
  }

  sendmessage() {
    viewmodel.sendmessage(conrollermessage.text, room);
    print('5555');
  }
}
