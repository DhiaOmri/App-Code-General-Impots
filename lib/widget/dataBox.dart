import '/Providers/Data.dart';
import 'package:flutter/material.dart';

class DataBox extends StatelessWidget {
  DataBox({Key? key, required this.item}) : super(key: key);
  final Data item;

  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2),
        child: Card(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    child: Text(
                      this.item.title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ]),
          ),
        ));
  }
}
