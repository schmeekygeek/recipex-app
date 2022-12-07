import 'dart:convert';
import 'package:http/http.dart' as http;

import '../classes/base.dart';

const String _url = "https://www.themealdb.com/api/json/v1/1/search.php?s=";
Future<Base> execute(String query) async {

  query.replaceAll(RegExp(r' '), '%20');
  final response = await http.get(Uri.parse("$_url${query.replaceAll(r' ', '%20')}".toLowerCase()));

  if(response.statusCode != 200){
    throw Exception("Error occured");
  }

  Base meals = Base.fromJson(jsonDecode(response.body));
  return meals;
}
