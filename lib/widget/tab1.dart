import 'package:code_general_impots/widget/recents.dart';

import '../Providers/Data.dart';
import '../widget/dataBoxList2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class tab1 extends StatelessWidget {
  const tab1({
    Key? key,
    required this.Datas,
  }) : super(key: key);
  final Future<List<Data>> Datas;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: TextField(
            onChanged: (value) {},
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
              hintText: "  Search",
              filled: true,
              fillColor: Colors.white,
              suffixIcon: Icon(Icons.search),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context).primaryColor, width: 2.0),
                borderRadius: BorderRadius.circular(25.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2.0),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20.0),
          height: 300.0,
          child: ListView(
            // This next line does the trick.
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  child: FutureBuilder<List<Data>>(
                    future: Datas,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) print(snapshot.error);
                      return snapshot.hasData
                          ? DataBoxList2(
                              items: snapshot.requireData
                                  .where((x) => x.parent == 0)
                                  .toList(),
                              Datas: Datas,
                            )
                          // return the ListView widget :
                          : Center(child: CircularProgressIndicator());
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        Recents(),
      ],
    );
  }
}
