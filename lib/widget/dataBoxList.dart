import 'package:code_general_impots/Providers/DataAr.dart';

import '../Providers/Data.dart';
import '../screen/scectionScreen.dart';
import 'package:flutter/material.dart';
import 'dataBox.dart';

class DataBoxList extends StatelessWidget {
  DataBoxList({Key? key, required this.items, required this.Datas});
  final List<Data> items;

  final Future<List<Data>> Datas;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Container(
          child: GestureDetector(
            child: DataBox(item: items[index], subdata: Datas),
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
        );
      },
    );
  }
}
