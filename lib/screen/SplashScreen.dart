import 'package:code_general_impots/Providers/Data.dart';
import 'package:code_general_impots/main.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  // void initSate(Datas) {
  //   super.initState();
  //   _navigatetohome(Datas);
  // }

  // _navigatetohome(Datas) async {
  //   await Future.delayed(Duration(seconds: 2), () {});

  //   Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(
  //           builder: (context) => MyHomePage(title: 'title', Datas: Datas)));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF062A5F),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color(0x00FFFFFF),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                                child: Image.network(
                                  'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Coat_of_arms_of_Chad.svg/1200px-Coat_of_arms_of_Chad.svg.png',
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'CODE ',
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      color: Color(0xFFD2C0A3),
                                      fontSize: 22,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  Text(
                                    'GÉNÉRAL  DES IMPOTS',
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      color: Color(0xFFD2C0A3),
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Text(
                          '2022',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Color(0x4DD2C0A3),
                            fontSize: 60,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
