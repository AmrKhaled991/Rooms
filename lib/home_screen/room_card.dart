import 'package:chat_app/Utils/roome_categorey_data.dart';
import 'package:chat_app/firebase/model/myroom.dart';
import 'package:flutter/material.dart';

import 'chatThread/ChatTread.dart';

class Roomcard extends StatelessWidget {
MyRoom room;
  Roomcard({required this.room});
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ChatTheard.RoutName,arguments: room);
      },
      child: Card(

        color: Colors.white,
         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
         child: Column(
          children: [
            SizedBox(height: 10,),
            Image.asset(Roomecategory.getcategory(room.id).photo,height: 60,width: 60,)
            ,SizedBox(height: 10,)
            ,Text(room.name)
          ],
        ),
      ),
    );
  }
}
