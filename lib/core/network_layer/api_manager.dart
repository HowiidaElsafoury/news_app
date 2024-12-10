import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/core/constants/constants.dart';
import 'package:news_app/models/source_model.dart';

import '../../models/article_model.dart';

class ApiManager {
  static Future<SourceModel> fetchSources(String category) async {
    // final response = await http.get(Uri.parse(
    //     "https://newsapi.org/v2/top-headlines/sources?apiKey=260206b9e8cf4cf1b1c4f2ef4f4ba583&category=$category"));

    const baseUrl = "${Constants.base_url}/v2/top-headlines/sources";
    final Map<String, String> queryParameters = {
      'apiKey': Constants.apiKey, // API Key
      'category': category, // Dynamic category
    };
    final uri = Uri.parse(baseUrl).replace(queryParameters: queryParameters);
    final response = await http.get(uri);
    var sourceData = SourceModel.fromJson(jsonDecode(response.body));
    debugPrint(response.body);
    if (response.statusCode == 200 &&
        jsonDecode(response.body)["status"] == "ok") {
      return sourceData;
    } else {
      throw Exception("failed to load source");
    }
  }
  static Future<ArticleModel> fetchArticles(String source) async{
    final Map<String,String> queryParameters={
      'apiKey': Constants.apiKey,
      'sources':source,
    };
    const baseUrl="${Constants.base_url}/v2/everything";
    final uri=Uri.parse(baseUrl).replace(queryParameters: queryParameters);
    final response =await http.get(uri);
    if(response.statusCode ==200 && jsonDecode(response.body)["status"]=="ok"){
      var articles =ArticleModel.fromJson(jsonDecode(response.body));
      return articles;
    }else{
      throw Exception("failed to load articles");
    }
  }
}