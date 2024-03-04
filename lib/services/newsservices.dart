import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:protal_app/Model/newsmodel.dart';

class NewsService {
  static Future<List<NewsModel>> getNews() async {
    final String data = await rootBundle.loadString('assets/news.json');
    final List<dynamic> jsonData = json.decode(data);
    return jsonData.map((json) => NewsModel.fromMap(json)).toList();
  }
}
