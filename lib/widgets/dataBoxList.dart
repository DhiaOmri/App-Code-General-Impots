import 'package:code_general_impots/Providers/Data.dart';

import 'package:code_general_impots/screen/scectionScreen.dart';
import 'package:code_general_impots/widget/dataBox.dart';
import 'package:flutter/material.dart';

class DataBoxList extends StatelessWidget {
  final List<Data> items;
  final Future<List<Data>> Datas;
  DataBoxList({Key? key, required this.items, required this.Datas});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            GestureDetector(
              child: DataBox(item: items[index]),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Sections(
                      item: items[index],
                      Datas: Datas,
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
