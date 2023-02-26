class MyUser {
  static String nameclass='nam';
  String id;
  String name;
  String email;
  String lastname;
  String username;

  MyUser({
    required this.id,
    required this.name,
    required this.lastname,
    required this.username,
    required this.email,
  });

  MyUser.fromjason(Map<String, dynamic> jeson)
      : this(
            id: jeson['id'] as String,
            name: jeson['name'] as String,
            email: jeson['email'] as String,
            lastname: jeson['lastname'] as String,
            username: jeson['username'] as String);


  Map<String,dynamic> tojeson(){
    return{
      'id':id,
      'name':name,
      'lastname':lastname,
      'username':username,
      'email':email,

    };
  }
}

