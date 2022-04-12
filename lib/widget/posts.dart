import 'package:flutter/material.dart';
import 'package:simple_html_css/simple_html_css.dart';

class PostPage extends StatefulWidget {
  PostPage({required this.posts});
  final String posts;

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  Widget postContent(htmlContent) {
    return RichText(
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
