import 'package:code_general_impots/widget/subDataBoxList.dart';
import 'package:rounded_expansion_tile/rounded_expansion_tile.dart';

import '/Providers/Data.dart';
import 'package:flutter/material.dart';

class DataBox extends StatelessWidget {
  DataBox({Key? key, required this.item, required this.subdata})
      : super(key: key);
  final Data item;
  final Future<List<Data>> subdata;
  Widget build(BuildContext context) {
    final GlobalKey expansionTileKey = GlobalKey();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Card(
            color: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            elevation: 8,
            child: RoundedExpansionTile(
              focusColor: Colors.pink,
              selectedTileColor: Colors.pink,
              leading: Icon(
                Icons.add,
                color: Colors.white,
              ),
              key: expansionTileKey,
              title: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Row(
                  children: [
                    Flexible(
                      child: Text(
                        this.item.title,
                        // maxLines: 1,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              children: <Widget>[
                FutureBuilder<List<Data>>(
                  future: subdata,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) print(snapshot.error);
                    return snapshot.hasData
                        ? subDataBoxList(
                            items: snapshot.requireData
                                .where((x) => x.parent == this.item.id)
                                .toList(),
                            Datas: subdata,
                          )
                        // return the ListView widget :
                        : Center(child: CircularProgressIndicator());
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
