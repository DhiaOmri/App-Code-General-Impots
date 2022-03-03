import 'package:code_general_impots/widget/tab1.dart';
import 'package:code_general_impots/widget/tab2.dart';

import '../Providers/Data.dart';
import '../widget/dataBoxList.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    Key? key,
    required this.Datas,
  }) : super(key: key);

  final Future<List<Data>> Datas;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 2),
      child: Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              DefaultTabController(
                length: 2, // length of tabs
                initialIndex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: TabBar(
                            unselectedLabelColor: Colors.redAccent,
                            indicatorSize: TabBarIndicatorSize.label,
                            indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.redAccent),
                            tabs: [
                              Tab(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                          color: Colors.redAccent, width: 1)),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text("Recherche"),
                                  ),
                                ),
                              ),
                              Tab(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                          color: Colors.redAccent, width: 1)),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text("Document"),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: Container(
                        height: 400, //height of TabBarView

                        child: TabBarView(
                          children: <Widget>[
                            tab1(
                              Datas: Datas,
                            ),
                            tab2(
                              Datas: Datas,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
