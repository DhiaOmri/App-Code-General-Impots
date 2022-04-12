import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Data.dart';

Future<List<Data>> fetchData() async {
  var http;
  final response = await http.get(Uri.parse(
      'https://demo.webixia.net/app-finance-tchad.tmp/index.php/wp-json/wp/v2/manual_documentation?per_page=99&orderby=id&status=publish'));
  if (response.statusCode == 200) {
    print(parseProducts(response.body).map((e) => e.category));
    return parseProducts(response.body);
  } else {
    throw Exception('Unable to fetch products from the REST API');
  }
}

List<Data> parseProducts(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Data>((json) => Data.fromMap(json)).toList();
}
