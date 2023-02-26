import 'package:chat_app/firebase/model/Mymessage.dart';
import 'package:chat_app/firebase/model/my_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/myroom.dart';

class UitelsFirebase {

  static CollectionReference<MyUser> getsorces() {
    return FirebaseFirestore.instance.collection(MyUser.nameclass)
        .withConverter<MyUser>
      (fromFirestore: (snapshot, options) => MyUser.fromjason(snapshot.data()!),
        toFirestore:
            (value, options) => value.tojeson());
  }

  static Future<void> registeruser(MyUser user) async {
    return getsorces().doc(user.id).set(user);
  }

  static Future<MyUser?> getuser(String userid) async {
    var user = await getsorces().doc(userid).get();
    return user.data();
  }

  static CollectionReference<MyRoom> getrooms() {
    return FirebaseFirestore.instance.collection(MyRoom.namclass).withConverter<
        MyRoom>
      (fromFirestore: (snapshot, options) => MyRoom.fromjeson(snapshot.data()!),
        toFirestore:
            (value, options) => value.tojeson());
  }

  static Future<void> creatroom(MyRoom room) async {
    var res = await getrooms().doc();
    room.idfirebase=res.id;
    res.set(room);
  }

  //  static Future <List<MyRoom>> getroomscategorey()async{
  //   var querys=await getrooms().get();
  // return querys.docs.map((querys) => querys.data()).toList();
  //  }

  static Stream<QuerySnapshot<MyRoom>> getroomscategorey() {
    var querys = getrooms().snapshots();
    return querys;
  }

  static CollectionReference<Message> getmessagesroom(String roomid) {
    return FirebaseFirestore.instance.collection(MyRoom.namclass)
    //b3t el id 3shan y5sh felroomm bt3to we y3rarfha
        .doc(roomid)
        .collection(Message.messages)
        .withConverter<Message>(
      fromFirestore: (snapshot, options) => Message.formjeson(snapshot.data()!),
      toFirestore: (value, options)=>value.tojeson(),);
  }

  static Future<void> sendmessage(Message message){
   var messageref=getmessagesroom(message.roomid!).doc();
    message.id=messageref.id;
    return messageref.set(message);
  }


}

