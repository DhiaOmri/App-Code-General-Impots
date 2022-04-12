import 'package:code_general_impots/Providers/Data.dart';
import 'package:code_general_impots/screen/scectionScreen.dart';
import 'package:code_general_impots/widget/subDataBox2.dart';
import 'package:flutter/material.dart';

class subDataBoxList2 extends StatelessWidget {
  const subDataBoxList2({Key? key, required this.items, required this.Datas})
      : super(key: key);
  final List<Data> items;
  final Future<List<Data>> Datas;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          child: subDataBox2(item: items[index], subdata: Datas),
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
        );
      },
    );
  }
}
