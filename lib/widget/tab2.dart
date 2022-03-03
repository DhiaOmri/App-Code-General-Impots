import '../widget/dataBoxList.dart';

import '../Providers/Data.dart';
import 'package:flutter/material.dart';

class tab2 extends StatelessWidget {
  const tab2({
    Key? key,
    required this.Datas,
  }) : super(key: key);

  final Future<List<Data>> Datas;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: FutureBuilder<List<Data>>(
          future: Datas,
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? DataBoxList(
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
    );
  }
}
