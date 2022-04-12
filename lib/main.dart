import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'package:code_general_impots/localization/locale_constant.dart';
import 'package:code_general_impots/localization/localizations_delegate.dart';
import 'package:code_general_impots/theme/LightTheme.dart';
import 'package:code_general_impots/theme/dark_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widget/homeBody.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Providers/Data.dart';
import 'Providers/theme_provider.dart';
import 'localization/language/languages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(sharedPreferences: prefs),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);
  static void setLocale(BuildContext context, Locale newLocale) {
    var state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }

  List<Data> parseDataFr(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Data>((json) => Data.fromMap(json)).toList();
  }

  Future<List<Data>> fetchDataFr() async {
    final response = await http.get(Uri.parse(
        'https://demo.webixia.net/app-finance-tchad.tmp/fr/index.php/wp-json/wp/v2/manual_documentation?per_page=99&orderby=id&status=publish'));
    if (response.statusCode == 200) {
      return parseDataFr(response.body);
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
    print('setLocale' + _locale.toString());
  }

  void didChangeDependencies() async {
    getLocale().then((locale) {
      setState(() {
        _locale = locale;
      });
    });
    super.didChangeDependencies();
    print('getLocale' + _locale.toString());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Provider.of<ThemeProvider>(context).darkTheme ? dark : light,
      home: AnimatedSplashScreen(
        duration: 3000,
        splash: Container(
          child: Image(
            fit: BoxFit.contain,
            image: AssetImage('assets/images/Splash_image.png'),
          ),
        ),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Color(0xFF062A5F),
        nextScreen: MyHomePage(
          title: 'Data Navigation demo home page',
          Datas: widget.fetchDataFr(),
        ),
        // pageTransitionType: PageTransitionType.fade,
      ),
      // home: Splash(),
      // home:ExpandableFab
      localizationsDelegates: [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: [
        Locale('fr', ''),
        Locale('ar', ''),
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale?.languageCode &&
              supportedLocale.countryCode == locale?.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  final Future<List<Data>> Datas;
  MyHomePage({Key? key, required this.title, required this.Datas})
      : super(key: key);

  // final items = Data.getDatas();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: Image(
                fit: BoxFit.contain,
                width: 50,
                height: 50,
                image: AssetImage('assets/images/img.jpeg'),
              ),
            ),
            Container(
              child: Text(
                Languages.of(context)!.appName,
                style: TextStyle(color: Colors.black87, fontSize: 16),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Icon(
                  Icons.flag_rounded,
                  color: Colors.black87,
                  size: 32,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: HomeBody(
          Datas: Datas,
        ),
      ),
    );
  }
}
