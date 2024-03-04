import 'package:flutter/material.dart';
import 'package:protal_app/Model/newsmodel.dart';
import 'package:protal_app/components/news_card.dart';
import 'package:protal_app/viewmodel/newsviewmodel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late NewsController _controller;

  @override
  void initState() {
    super.initState();
    _controller = NewsController();
  }

  viewDidLoad() { }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News App"),
      ),
    );
  }
}
