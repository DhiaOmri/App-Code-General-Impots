import '../Providers/Data.dart';
import '../screen/scectionScreen.dart';
import 'package:flutter/material.dart';
import 'dataBox.dart';

class DataBoxList extends StatelessWidget {
  final List<Data> items;
  DataBoxList({Key? key, required this.items, required this.Datas});
  final Future<List<Data>> Datas;
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
