import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:material_two_news_app/data/news.dart';

String apiKey = 'f342cff3d5de4e6abc0604909f533bf4';

String baseUrl = 'https://newsapi.org/v2/top-headlines';

class News {
  Future<List<Article>> getNews() async {
    String url = '$baseUrl?country=id&apiKey=$apiKey';
    var response = await http.get(Uri.parse(url));
    try {
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        var result = data['articles'] as List;
        List<Article> list =
            result.map<Article>((json) => Article.fromJson(json)).toList();
        print(response.body);
        return list;
      } else {
        return <Article>[]; 
      }
    } catch (e) {
      print(e);
      return <Article>[];
    }
  }

  Future<List<Article>> getNewsByCategory(String category) async {
    String url = '$baseUrl?country=id&apiKey=$apiKey&category=$category';
    var response = await http.get(Uri.parse(url));
    try {
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        var result = data['articles'] as List;
        List<Article> list =
            result.map<Article>((json) => Article.fromJson(json)).toList();
        print(response.body);
        return list;
      } else {
        return <Article>[]; 
      }
    } catch (e) {
      print(e);
      return <Article>[];
    }
  }
}
