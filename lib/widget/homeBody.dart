import 'package:code_general_impots/localization/language/languages.dart';
import 'package:code_general_impots/localization/locale_constant.dart';
import 'package:code_general_impots/model/language_data.dart';
import 'package:code_general_impots/widget/tab1.dart';
import 'package:code_general_impots/widget/tab2.dart';

import '../Providers/Data.dart';

import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    Key? key,
    required this.Datas,
  }) : super(key: key);

  final Future<List<Data>> Datas;

  @override
  Widget build(BuildContext context) {
    _createLanguageDropDown() {
      return DropdownButton<LanguageData>(
        iconSize: 30,
        hint: Text(Languages.of(context)!.labelSelectLanguage),
        onChanged: (LanguageData? language) {
          assert(language != null);
          changeLanguage(context, language!.languageCode);
        },
        items: LanguageData.languageList()
            .map<DropdownMenuItem<LanguageData>>(
              (e) => DropdownMenuItem<LanguageData>(
                value: e,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      e.flag,
                      style: TextStyle(fontSize: 30),
                    ),
                    // Text(e.name)
                  ],
                ),
              ),
            )
            .toList(),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 2),
      child: Container(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <
                Widget>[
          DefaultTabController(
            length: 2, // length of tabs
            initialIndex: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // _createLanguageDropDown(),
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
                        unselectedLabelColor: Theme.of(context).primaryColor,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Theme.of(context).primaryColor),
                        tabs: [
                          Tab(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    color: Theme.of(context).primaryColor,
                                    width: 1),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(Languages.of(context)!.research),
                              ),
                            ),
                          ),
                          Tab(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color: Theme.of(context).primaryColor,
                                      width: 1)),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(Languages.of(context)!.documents),
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Container(
                    //height of TabBarView
                    height: MediaQuery.of(context).size.height,
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
