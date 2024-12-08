import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';

class ArticleView extends StatelessWidget {
  Articles articles;

  ArticleView(this.articles);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(articles.urlToImage ??
                "https://www.istockphoto.com/vector/image-preview-icon-picture-placeholder-for-website-or-ui-ux-design-vector-gm1222357475-358652058"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text(
              articles.source?.name ?? "",
              style: const TextStyle(color: Color(0xFF79828B), fontSize: 12),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text(
              articles.title ?? "",
              style: const TextStyle( fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text(
              articles.publishedAt ?? "",
              style: const TextStyle(color: Color(0xFF79828B), fontSize: 14),
              textAlign: TextAlign.end,
            ),
          )
        ],
      ),
    );
  }
}
