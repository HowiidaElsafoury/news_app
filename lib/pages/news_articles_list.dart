import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/pages/articles_view.dart';

import '../core/network_layer/api_manager.dart';
import '../models/source_model.dart' as SourceModel;

class NewsArticalsList extends StatelessWidget {
  SourceModel.Source sourc;

  NewsArticalsList({
    super.key,
    required this.sourc,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ArticleModel>(
      future: ApiManager.fetchArticles(sourc.id),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        List<Articles> articalsList = snapshot.data?.articles ?? [];
        return ListView.builder(
          padding: EdgeInsets.all(20),
          itemBuilder: (context, index) =>
              ArticleView(articles: articalsList[index]),
          itemCount: articalsList.length,
        );
      },
    );
  }
}