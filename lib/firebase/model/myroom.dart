class MyRoom {
  static String namclass='rooms';
  String id;
  String name;
  String des;
  String? idfirebase;

  MyRoom({ this.idfirebase,required this.id, required this.name, required this.des,});

  Map<String, dynamic> tojeson() {
    return {
      'id': id,
      'name': name,
      'des': des,
      'idfirebase': idfirebase,
    };
  }
    MyRoom.fromjeson(Map<String, dynamic>jeson): this(
    id: jeson['id'] ,
      idfirebase: jeson['idfirebase'] ,
    name: jeson['name'] ,
    des: jeson['des'],
    );

}