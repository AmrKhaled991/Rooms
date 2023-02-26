import 'package:chat_app/LoginScreen/logenscreen.dart';
import 'package:chat_app/add_rome/add_rome.dart';
import 'package:chat_app/Utils/data_backed.dart';
import 'package:chat_app/firebase/detabase/firebase_utils.dart';
import 'package:chat_app/firebase/model/myroom.dart';
import 'package:chat_app/home_screen/Home_viewmodel.dart';
import 'package:chat_app/home_screen/room_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomescreen extends StatefulWidget {
  static String routname = 'name';

  @override
  State<MyHomescreen> createState() => _MyHomescreenState();
}

class _MyHomescreenState extends BaseStat<MyHomescreen, HomescreenViewmodel>
    implements homescreen_navigator {
  @override
  HomescreenViewmodel intitvieNaigat() {
    return HomescreenViewmodel();
  }


  Widget build(BuildContext context) {
    var mediaquary = MediaQuery
        .of(context)
        .size;
    return ChangeNotifierProvider(
      create: (context) => viewmodel,
        child: Stack(children: [
          Container(
            color: Colors.white,
          ),
          Image.asset('assets/images/photo1.png'),
          Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                title: Text('Homescreen'),
                centerTitle: true,
                elevation: 0,
                backgroundColor: Colors.transparent,
                actions: [
                  IconButton(icon:Icon (Icons.login,color: Colors.white,),onPressed:() {
                  FirebaseAuth.instance.signOut();
                    Navigator.pushReplacementNamed(context,LoginScreen.routname);
                  },
                  )
                ],
              )
          ,body: Card(elevation: 0,color: Colors.transparent,
            margin: EdgeInsets.symmetric(vertical: 25,horizontal: 15),
            child:  StreamBuilder<QuerySnapshot<MyRoom>>(
                stream: UitelsFirebase.getroomscategorey(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Column(
                        children: [
                          Text('somthing went wrong'),
                          ElevatedButton(onPressed: () {
                            setState(() {

                            });
                          }, child: Text('refresh'))
                        ]
                        ,
                      ),
                    );
                  }
                  var  listrooms = snapshot.data!.docs.map((queyres) =>
                      queyres.data()).toList();
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8),
                    itemBuilder: (context, index) {
                      return Roomcard(room: listrooms[index]);
                    },
                    itemCount:listrooms.length,
                  );
                }
            ),
          ),
          ),
          // Consumer<HomescreenViewmodel>(
          //   builder: (BuildContext,HomescreenViewmodel,_){
          //     return Positioned(
          //       bottom: 15,
          //       right: 25,
          //       left: 25,
          //       child:
          //        Container(
          //               width: mediaquary.width * .85,
          //               height: mediaquary.height * .8,
          //               color: Colors.orange,
          //               child: GridView.builder(
          //                 gridDelegate:
          //                     SliverGridDelegateWithFixedCrossAxisCount(
          //                         crossAxisCount: 2,
          //                         mainAxisSpacing: 8,
          //                         crossAxisSpacing: 8),
          //                 itemCount: viewmodel.rooms.length,
          //                 itemBuilder: (context, index)
          //                 {
          //                   Roomcard(room: HomescreenViewmodel.rooms[index]);
          //                   print('lenthhhv ${HomescreenViewmodel.rooms.length}');
          //                 },
          //               ),
          //             )
          //     );
          //   },
          // )
          //use comsumer 3shen law itghier aw lma get eldata



          Align(heightFactor: 13.3, widthFactor: 6.2,
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
                child: Text(
                  '+',
                  style: TextStyle(fontSize: 30),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, Add_Rome.routname);
                }),
          ),

        ]),
    );
  }
}
