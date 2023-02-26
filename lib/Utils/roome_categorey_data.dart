class Roomecategory{
  String id;
  String name;
  String photo;
  Roomecategory({required this.id,required this.name, required this.photo});
  static List<Roomecategory> getcategories(){
    return [
      Roomecategory(id: 'sports', name: 'sports', photo: 'assets/images/sports.png'),
      Roomecategory(id: 'music', name: 'music', photo: 'assets/images/music.png'),
      Roomecategory(id: 'movies', name: 'movies', photo: 'assets/images/movies.png')
    ];
  }
  static Roomecategory getcategory(String id){
    switch(id){
      case 'sports':{
        return    Roomecategory(id: 'sports', name: 'sports', photo: 'assets/images/sports.png');
      }
      case 'music':{
        return Roomecategory(id: 'music', name: 'music', photo: 'assets/images/music.png');
      }
      case 'movies':{
        return Roomecategory(id: 'movies', name: 'movies', photo: 'assets/images/movies.png');
      }

    }{
      return Roomecategory(id: 'sports', name: 'sports', photo: 'assets/images/sports.png');
    }
   }
}