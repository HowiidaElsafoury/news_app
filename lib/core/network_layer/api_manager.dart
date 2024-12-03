import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/core/constants/constants.dart';
import 'package:news_app/models/source_model.dart';

class ApiManager {
  static Future<SourceModel> fetchSources(String category) async {
    final response = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines/sources?apiKey=260206b9e8cf4cf1b1c4f2ef4f4ba583&category=$category"));

   // var query={
   //   "apiKey":Constants.apiKey,
   //   "category":category,
   // };
   //
   //  final response=await http.get(
   //    Uri.https(Constants.base_url,"/v2/top-headlines/sources",query),
   //   );
   // debugPrint("API Response: ${response.body}");

   var sourceData = SourceModel.fromJson(jsonDecode(response.body));
    debugPrint(response.body);
    if (response.statusCode == 200 &&
        jsonDecode(response.body)["status"] == "ok") {
      return sourceData;
    } else {
      throw Exception("an error occured");
    }
  }
}
