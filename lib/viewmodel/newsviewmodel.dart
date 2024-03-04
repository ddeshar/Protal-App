import 'dart:async';
import 'package:protal_app/Model/newsmodel.dart';
import 'package:protal_app/services/newsservices.dart';

class NewsController {
  late List<NewsModel> _newsList;
  late Future<List<NewsModel>> _newsFuture;

  List<NewsModel> get newsList => _newsList;

  NewsController() {
    _newsList = [];
    _newsFuture = _fetchNews();
  }

  Future<List<NewsModel>> _fetchNews() async {
    try {
      _newsList = await NewsService.getNews();
      return _newsList;
    } catch (e) {
      throw e;
    }
  }

  Future<List<NewsModel>> refreshNews() async {
    _newsList = await _fetchNews();
    return _newsList;
  }

  Future<List<NewsModel>> getNews() async {
    return _newsFuture;
  }
}
