import 'package:code_general_impots/theme/LightTheme.dart';
import 'package:code_general_impots/theme/dark_theme.dart';
import 'package:provider/provider.dart';

import '../widget/homeBody.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'Providers/Data.dart';
import 'Providers/theme_provider.dart';

void main() => runApp(MyApp(Datas: fetchProducts()));

List<Data> parseProducts(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Data>((json) => Data.fromMap(json)).toList();
}

Future<List<Data>> fetchProducts() async {
  final response = await http.get(Uri.parse(
      'https://demo.webixia.net/app-finance-tchad.tmp/index.php/wp-json/wp/v2/docs?per_page=100&orderby=id&status=publish'));
  if (response.statusCode == 200) {
    return parseProducts(response.body);
  } else {
    throw Exception('Unable to fetch products from the REST API');
  }
}

class MyApp extends StatelessWidget {
  final Future<List<Data>> Datas;
  MyApp({Key? key, required this.Datas}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Provider.of<ThemeProvider>(context).darkTheme ? dark : light,
      home: MyHomePage(title: 'Data Navigation demo home page', Datas: Datas),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  final Future<List<Data>> Datas;
  MyHomePage({Key? key, required this.title, required this.Datas})
      : super(key: key);

  // final items = Data.getDatas();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: Image(
                fit: BoxFit.contain,
                width: 50,
                height: 50,
                image: AssetImage('assets/images/img.jpeg'),
              ),
            ),
            Container(
              child: Text(
                "Code Général des l'impots 2022",
                style: TextStyle(color: Colors.black87, fontSize: 16),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Icon(
                  Icons.flag_rounded,
                  color: Colors.black87,
                  size: 32,
                ),
              ),
            ),
          ],
        ),
      ),
      body: HomeBody(Datas: Datas),
    );
  }
}
