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

  viewDidLoad() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("News App"),
        ),
        body: FutureBuilder<List<NewsModel>>(
          future: _controller.getNews(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                child: Text('No News Available'),
              );
            } else {
              return RefreshIndicator(
                onRefresh: () async {
                  await _controller.refreshNews();
                  setState(() {});
                },
                child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (contect, index) {
                      NewsModel news = snapshot.data![index];
                      return NewsCard(
                        imgUrl: news.image,
                        title: news.title,
                        desc: news.body,
                      );
                    }),
              );
            }
          },
        ));
  }
}
