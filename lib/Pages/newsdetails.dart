import 'package:flutter/material.dart';

class NewsDetailsPage extends StatelessWidget {
  final String imgUrl, title, body;

  NewsDetailsPage({
    required this.imgUrl,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
    );
  }
}
