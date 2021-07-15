import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:marketticker/models/priceModel.dart';

class ApiService{
  Future<dynamic> getAllData() async {
    final response =
    await http.get(Uri.parse('http://api.exchangeratesapi.io/v1/latest?access_key=1489f211835469ffdb27f0186d2a88bd'));

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