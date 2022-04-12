import 'package:code_general_impots/Providers/Data.dart';
import 'package:code_general_impots/widget/subDataBoxList.dart';
import 'package:code_general_impots/widget/subDataBoxList2.dart';
import 'package:flutter/material.dart';
import 'package:rounded_expansion_tile/rounded_expansion_tile.dart';

class subDataBox extends StatelessWidget {
  const subDataBox({Key? key, required this.item, required this.subdata})
      : super(key: key);
  final Data item;
  final Future<List<Data>> subdata;
  @override
  Widget build(BuildContext context) {
    final GlobalKey expansionTileKey = GlobalKey();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(0.0),
          child: ExpansionTile(
            key: expansionTileKey,
            onExpansionChanged: (value) {
              if (value) {
                _scrollToSelectedContent(expansionTileKey: expansionTileKey);
              }
            },
            collapsedBackgroundColor: Colors.white,
            backgroundColor: Colors.white,
            collapsedTextColor: Colors.white,
            iconColor: Colors.black,
            collapsedIconColor: Colors.black,
            title: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                // color: Theme.of(context).primaryColor
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.book,
                    color: Theme.of(context).primaryColor,
                  ),
                  SizedBox(width: 10),
                  Flexible(
                    child: Text(
                      this.item.title,
                      // maxLines: 1,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                ],
              ),
            ),
            // subtitle: Text('Trailing expansion arrow icon'),
            children: <Widget>[
              // ListTile(title: Text(this.item.id.toString())),
              FutureBuilder<List<Data>>(
                future: subdata,
                builder: (context, snapshot) {
                  if (snapshot.hasError) print(snapshot.error);
                  return snapshot.hasData
                      ? subDataBoxList2(
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
        // Card(
        //   color: Theme.of(context).shadowColor,
        //   shape:
        //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        //   child: RoundedExpansionTile(
        //     shape:
        //         RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        //     title: Text('Some title'),
        //     children: [
        //       Text('child1'),
        //       Text('child1'),
        //       Text('child1'),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}

void _scrollToSelectedContent({GlobalKey? expansionTileKey}) {
  final keyContext = expansionTileKey?.currentContext;
  if (keyContext != null) {
    Future.delayed(Duration(milliseconds: 200)).then((value) {
      Scrollable.ensureVisible(keyContext,
          duration: Duration(milliseconds: 200));
    });
  }
}
