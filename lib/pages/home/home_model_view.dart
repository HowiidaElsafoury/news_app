import 'package:flutter/material.dart';
import 'package:news_app/core/network_layer/api_manager.dart';
import 'package:news_app/models/source_model.dart' as SourceModel;
import 'package:news_app/widgets/article_list_view.dart';

import '../../models/article_model.dart' as ArticleModel;

class HomeViewModel extends ChangeNotifier{
  List<SourceModel.Source> _sourcesList=[];
  List<ArticleModel.Articles> _articlesList=[];
  
  List<SourceModel.Source> get sourcesList => _sourcesList;
  List<ArticleModel.Articles> get articlesList =>_articlesList;

  getSources (String categoryId) async {
    try{
      var response =await ApiManager.fetchSources(categoryId);
      if(response.status == "ok"){
        _sourcesList= response.sources;
        notifyListeners();
      }else {
        //show error message
      }

    } catch(e){
      print(e.toString());
    }

  }
  getArticles(String sourceId) async {
    try{
      var response =await ApiManager.fetchArticles(sourceId);
      if(response.status == "ok"){
        _articlesList=response.articles ?? [];
        notifyListeners();
      }else{
        //show error message
      }

    }catch(e){
      print(e.toString());
    }

  }
}
