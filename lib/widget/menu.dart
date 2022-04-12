import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
    );
  }
}
