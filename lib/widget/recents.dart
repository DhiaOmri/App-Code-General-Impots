import 'package:code_general_impots/utill/styles.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Recents extends StatefulWidget {
  const Recents({Key? key}) : super(key: key);

  @override
  State<Recents> createState() => _RecentsState();
}

class _RecentsState extends State<Recents> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(FontAwesomeIcons.clock),
            SizedBox(width: 8),
            Text(
              'Récents',
              style: rubikRegular.copyWith(
                fontSize: 18,
              ),
            ),
          ],
        ),
        SizedBox(height: 5),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          elevation: 3,
          child: ListTile(
            leading: Container(
              alignment: Alignment.center,
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(
                FontAwesomeIcons.solidCopy,
                color: Colors.white,
                size: 20,
              ),
            ),
            title: Text('Titre de document'),
            subtitle:
                Text('A sufficiently long subtitle warrants three lines.'),
            trailing: Icon(
              Icons.bookmark,
              color: Theme.of(context).primaryColor,
              size: 30,
            ),
            isThreeLine: true,
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          elevation: 3,
          child: ListTile(
            leading: Container(
              alignment: Alignment.center,
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(
                FontAwesomeIcons.solidCopy,
                color: Colors.white,
                size: 20,
              ),
            ),
            title: Text('Titre de document'),
            subtitle:
                Text('A sufficiently long subtitle warrants three lines.'),
            trailing: Icon(
              Icons.bookmark,
              color: Theme.of(context).primaryColor,
              size: 30,
            ),
            isThreeLine: true,
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          elevation: 3,
          child: ListTile(
            leading: Container(
              alignment: Alignment.center,
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(
                FontAwesomeIcons.solidCopy,
                color: Colors.white,
                size: 20,
              ),
            ),
            title: Text('Titre de document'),
            subtitle:
                Text('A sufficiently long subtitle warrants three lines.'),
            trailing: Icon(
              Icons.bookmark,
              color: Theme.of(context).primaryColor,
              size: 30,
            ),
            isThreeLine: true,
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          elevation: 3,
          child: ListTile(
            leading: Container(
              alignment: Alignment.center,
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(
                FontAwesomeIcons.solidCopy,
                color: Colors.white,
                size: 20,
              ),
            ),
            title: Text('Titre de document'),
            subtitle:
                Text('A sufficiently long subtitle warrants three lines.'),
            trailing: Icon(
              Icons.bookmark,
              color: Theme.of(context).primaryColor,
              size: 30,
            ),
            isThreeLine: true,
          ),
        ),
      ],
    );
  }
}
