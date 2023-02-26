class Message {
  static String messages = 'messages';
  String? sendername;
  String? messagecontent;
  String? roomid;
  String? id;
  int? datetime;

  Message(
      {required this.messagecontent,
      required this.datetime,
      required this.roomid,
      required this.sendername, this.id});

  Message.formjeson(Map<String,dynamic> jeson):this(
    sendername: jeson['sendername'],
    messagecontent: jeson['messagecontent'],
    roomid: jeson['roomid'],
    id: jeson['id'],
    datetime: jeson['datetime'],

  );


   Map<String,dynamic> tojeson(){
     return{
       'sendername':sendername,
       'messagecontent':messagecontent,
       'roomid':roomid,
       'id':id,
       'datetime':datetime,
     };
   }
}
