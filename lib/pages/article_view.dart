import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';

class ArticleView extends StatelessWidget {
  Articles articleModel;

  ArticleView(this.articleModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(articleModel.urlToImage ??
                "https://www.istockphoto.com/vector/image-preview-icon-picture-placeholder-for-website-or-ui-ux-design-vector-gm1222357475-358652058"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text(
              articleModel.source?.name ?? "",
              style: TextStyle(color: Color(0xFF79828B), fontSize: 12),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text(
              articleModel.title ?? "",
              style: TextStyle( fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text(
              articleModel.publishedAt ?? "",
              style: TextStyle(color: Color(0xFF79828B), fontSize: 14),
              textAlign: TextAlign.end,
            ),
          )
        ],
      ),
    );
  }
}
