import 'package:code_general_impots/Providers/Data.dart';
import 'package:code_general_impots/screen/scectionScreen.dart';
import 'package:flutter/material.dart';

class DataBoxList2 extends StatelessWidget {
  final List<Data> items;
  final Future<List<Data>> Datas;
  const DataBoxList2({Key? key, required this.items, required this.Datas})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: items.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            alignment: Alignment.centerLeft,
            width: 200,
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
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.amberAccent,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Icon(
                                Icons.book,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 200,
                          child: GestureDetector(
                            child: Text(
                              items[index].title,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.redAccent,
                              ),
                            ),
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
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            '05',
                            style: TextStyle(
                              fontSize: 34,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Livres',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        alignment: Alignment.topCenter,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: LinearProgressIndicator(
                            value: 0.7,
                            backgroundColor: Colors.grey.shade400,
                            color: Colors.blue[600],
                            minHeight: 8,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
    ;
  }
}
