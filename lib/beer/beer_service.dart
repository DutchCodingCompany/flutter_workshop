import 'dart:convert';

import 'package:flutter_workshop/beer/beer.dart';
import 'package:http/http.dart' as http;

class BeerService {
  const BeerService() : super();

  Future<List<Beer>> fetchBeers() async {
    final response = await http.get(Uri.parse('https://api.punkapi.com/v2/beers'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return (jsonDecode(response.body) as List<dynamic>).map((e) => Beer.fromJson(e as Map<String, dynamic>)).toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load beers');
    }
  }
}
