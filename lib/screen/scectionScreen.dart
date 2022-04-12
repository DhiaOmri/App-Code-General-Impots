import 'package:code_general_impots/Providers/DataAr.dart';
import 'package:code_general_impots/screen/artLanguage.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../Providers/Data.dart';
import '../widget/dataBoxList.dart';
import '../widget/posts.dart';
import 'package:flutter/material.dart';

class Sections extends StatelessWidget {
  Sections({Key? key, required this.item, required this.Datas})
      : super(key: key);
  final Data item;

  final Future<List<Data>> Datas;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(this.item.title),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      floatingActionButton: this.item.content.length > 0
          ? SpeedDial(
              icon: Icons.language_rounded,
              backgroundColor: Theme.of(context).primaryColor,
              children: [
                SpeedDialChild(
                  child: Text('🇸🇦'),
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  label: 'Arabe',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => artLanguage(
                          id: this.item.id,
                          posts: this.item.content,
                          lang: 'ar',
                        ),
                      ),
                    );
                  },
                  onLongPress: () => debugPrint('Ar LONG PRESS'),
                ),
                SpeedDialChild(
                  child: Text('🇫🇷'),
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  label: 'Français',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => artLanguage(
                          id: this.item.id,
                          posts: this.item.content,
                          lang: 'fr',
                        ),
                      ),
                    );
                  },
                  onLongPress: () => debugPrint('Fr LONG PRESS '),
                ),
              ],
            )
          : SpeedDial(
              visible: false,
            ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: FutureBuilder<List<Data>>(
              future: Datas,
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                return snapshot.hasData
                    ? Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: DataBoxList(
                              items: snapshot.requireData
                                  .where((x) => x.parent == this.item.id)
                                  .toList(),
                              Datas: Datas,
                            ),
                          ),
                          // Text(this.item.content),
                          this.item.content.length > 0
                              ? PostPage(
                                  posts: this.item.content,
                                )
                              : SizedBox(),
                        ],
                      )
                    // return the ListView widget :
                    : Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ),
      ),
    );
  }
}
