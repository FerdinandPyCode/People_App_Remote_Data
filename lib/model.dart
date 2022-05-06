class Human {
  final String id;
  final String firstname;
  final String lastname;
  final String adress;
  final String phone;
  final String gender;
  final String picture;
  final String citation;


  Human({
    this.id="",
    required this.firstname,
    required this.lastname,
    //this.birthday,
    required this.adress,
    required this.phone,
    //required this.mail,
    required this.gender,
    required this.picture,
    required this.citation,
  });

  Map<String,dynamic> toMap() {
    return {
      //'id': id,
      'firstname': firstname,
      'lastname': lastname,
      //'birthday': birthday,
      'adress': adress,
      'phone': phone,
      //'mail': mail,
      'gender': gender,
      'picture': picture,
      'citation': citation,
    };
  }

  Human.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        firstname = res["firstname"],
        lastname = res["lastname"],
        //birthday = res["birthday"],
        adress = res["adress"],
        phone = res["phone"],
        //mail = res["mail"],
        gender = res["gender"],
        picture = res["picture"],
        citation = res["citation"];

  @override
  String toString() {
    return 'todo{ firstname : $firstname, lastname:$lastname,adress:$adress,phone:$phone,gender:gender,picture:$picture,citation:$citation}';
  }
}