import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  Future<dynamic> getAllData() async {
    final response = await http.get(Uri.parse('http://api.exchangeratesapi'
        '.io/v1/fluctuation?access_key=cdce9f34f9cc7ab8c7bc6078b354627e'
        '&start_date=2021-07-14&end_date=2021-07-15'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      var _response = await jsonDecode(response.body);
      print(_response);
      return _response;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load data');
    }
  }
}
