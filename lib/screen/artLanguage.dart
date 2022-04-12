import 'package:flutter/material.dart';

class artLanguage extends StatelessWidget {
  const artLanguage(
      {Key? key, required this.id, required this.lang, required this.posts})
      : super(key: key);
  final int id;
  final String lang;
  final String posts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        children: [
          Text(lang + id.toString()),
          Text(posts),
        ],
      ),
    );
  }
}
