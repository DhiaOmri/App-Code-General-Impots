// import 'package:flutter/material.dart';

// import 'package:flutter/material.dart';

// class FlutterLocalization extends StatelessWidget {
//   const FlutterLocalization({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     _title(String val) {
//       switch (val) {
//         case 'en':
//           return Text(
//             'English',
//             style: TextStyle(fontSize: 16.0),
//           );
//         case 'id':
//           return Text(
//             'Indonesia',
//             style: TextStyle(fontSize: 16.0),
//           );

//         case 'es':
//           return Text(
//             'Spanish',
//             style: TextStyle(fontSize: 16.0),
//           );

//         case 'it':
//           return Text(
//             'Italian',
//             style: TextStyle(fontSize: 16.0),
//           );

//         default:
//           return Text(
//             'English',
//             style: TextStyle(fontSize: 16.0),
//           );
//       }
//     }

//     return Consumer<LocaleProvider>(builder: (context, provider, snapshot) {
//       var lang = provider.locale ?? Localizations.localeOf(context);
//       return Scaffold(
//         appBar: AppBar(
//           title: Text('Localization Demo'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 AppLocalizations.of(context)!.english_language,
//                 style: TextStyle(
//                   fontSize: 20.0,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//               SizedBox(height: 85.0),
//               DropdownButton(
//                   value: lang,
//                   onChanged: (Locale? val) {
//                     provider.setLocale(val!);
//                   },
//                   items: L10n.all
//                       .map((e) => DropdownMenuItem(
//                             value: e,
//                             child: _title(e.languageCode),
//                           ))
//                       .toList())
//             ],
//           ),
//         ),
//       );
//     });
//   }
// }
