import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/src/models/category_model.dart';
import 'package:news_app/src/models/news_models.dart';
import 'package:http/http.dart' as http;

const _BaseUrl = 'newsapi.org';
const _ApiKey = 'ce15291e45f146ff946be60b04c6b435';
const _Country = 'us';

class NewsService with ChangeNotifier {
  List<Article> headlines = [];
  String _selectedCategory = 'business';
  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.volleyball, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology'),
  ];

  Map<String, List<Article>> categoryArticles = {};

  NewsService() {
    getTopHeadlines();
    categories.forEach((item) {
      categoryArticles[item.name] = [];
    });
  }

  String get selectedCategory => _selectedCategory;
  set selectedCategory(String valor) {
    _selectedCategory = valor;
    getArticlesByCategories(valor);
    notifyListeners();
  }

  List<Article> get getArticulosCategoriaSeleccionada =>
      categoryArticles[this.selectedCategory]!;

  getTopHeadlines() async {
    final uri = Uri.https(
        _BaseUrl, 'v2/top-headlines', {"apiKey": _ApiKey, "country": _Country});

    final resp = await http.get(uri);

    final newsResponse = newsResponseFromJson(resp.body);

    headlines.addAll(newsResponse.articles);

    notifyListeners();
  }

  getArticlesByCategories(String category) async {
    if (categoryArticles[category]!.isNotEmpty) {
      return categoryArticles[category];
    }
    final uri = Uri.https(_BaseUrl, 'v2/top-headlines',
        {"apiKey": _ApiKey, "country": _Country, "category": category});

    final resp = await http.get(uri);

    final newsResponse = newsResponseFromJson(resp.body);

    categoryArticles[category]!.addAll(newsResponse.articles);

    notifyListeners();
  }
}
