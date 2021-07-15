import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService{
  Future<dynamic> getAllData() async {
    final response =
    await http.get(Uri.parse('http://api.exchangeratesapi.io/v1/latest?access_key=94416d8ac0fd69db86c8b130324e16ea'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

       var _response= await jsonDecode(response.body);
       print(_response);
       return _response;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}