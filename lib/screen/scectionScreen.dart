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
      appBar: AppBar(
        title: Text(this.item.title),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(0),
          child: FutureBuilder<List<Data>>(
            future: Datas,
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              return snapshot.hasData
                  ? Column(
                      children: [
                        DataBoxList(
                          items: snapshot.requireData
                              .where((x) => x.parent == this.item.id)
                              .toList(),
                          Datas: Datas,
                        ),
                        // Text(this.item.content),

                        PostPage(
                          posts: this.item.content,
                        ),
                      ],
                    )
                  // return the ListView widget :
                  : Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
