import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:people/model.dart';

class FetchData {
  String urlString = "https://ifri.raycash.net/getusers";
  List<Human> mylist = [];

  Future<List<Human>> fetchPeople() async {
    final response = await http.get(Uri.parse(urlString));
    //final response = await http.get(Uri.parse(urlString));

    if (response.statusCode == 200) {
      

      var total = jsonDecode(response.body)["message"] as List;

      total.forEach((element) {
        mylist.add(Human.fromMap(element));
      });

      return mylist;
    } else {
      
      
      throw Exception('Failed to load album');
    }
  }

  Future<http.Response> createHuman(Human human) {
    return http.post(
      Uri.parse('https://ifri.raycash.net/adduser'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(human.toMap()),
    );
  }
}
