import 'dart:convert';

import 'package:flutter_workshop/beer/beer.dart';
import 'package:flutter_workshop/beer/beer_service.dart';

import '../beer_test_response.dart';

class MockBeerService extends BeerService {
  @override
  Future<List<Beer>> fetchBeers() async {
    return (jsonDecode(beerTestResponse) as List<dynamic>)
        .map((e) => Beer.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
