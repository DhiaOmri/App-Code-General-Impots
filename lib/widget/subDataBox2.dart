import 'package:code_general_impots/Providers/Data.dart';
import 'package:code_general_impots/widget/subDataBoxList2.dart';
import 'package:flutter/material.dart';

class subDataBox2 extends StatelessWidget {
  const subDataBox2({Key? key, required this.item, required this.subdata})
      : super(key: key);
  final Data item;
  final Future<List<Data>> subdata;
  @override
  Widget build(BuildContext context) {
    final GlobalKey expansionTileKey = GlobalKey();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                          color: Theme.of(context).primaryColor,
                        ),
                        child: Icon(
                          Icons.copy,
                          color: Colors.white,
                        )),
                  ),
                  SizedBox(width: 10),
                  Flexible(
                    child: Text(
                      this.item.title,
                      // maxLines: 1,
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ],
              ),
            ),
            // subtitle: Text('Trailing expansion arrow icon'),
            children: <Widget>[
              // ListTile(title: Text(this.item.id.toString())),
              ListTile(
                  title: Text('lire la suite',
                      style: Theme.of(context).textTheme.headline1)),
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
