import 'package:code_general_impots/Providers/Data.dart';

import 'package:flutter/material.dart';
import 'package:simple_html_css/simple_html_css.dart';

class PostPageTranslate extends StatefulWidget {
  PostPageTranslate({required this.posts});
  final List<Data> posts;

  @override
  _PostPageTranslateState createState() => _PostPageTranslateState();
}

class _PostPageTranslateState extends State<PostPageTranslate> {
  Widget postContent(htmlContent) {
    return RichText(
      textAlign: TextAlign.right,
      text: HTML.toTextSpan(context, htmlContent),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 6),
            postContent(
              widget.posts,
            ),
          ],
        ),
      ),
    );
  }
}
