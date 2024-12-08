import 'package:flutter/material.dart';
import 'package:news_app/core/network_layer/api_manager.dart';
import 'package:news_app/pages/article_view.dart';

class ArticleListView extends StatelessWidget {
  String sourceId;
  ArticleListView(this.sourceId);

  @override
  Widget build(BuildContext context) {
    return Container();
      // FutureBuilder(future: ApiManager.fetchArticles(sourceId),
      //   builder: (context, snapshot) {
      //     if (snapshot.hasError) {
      //       return Column(
      //         children: [
      //           Text("${snapshot.error}"),
      //           IconButton(
      //             onPressed: () {
      //             },
      //             icon: const Icon(Icons.refresh_outlined),
      //           ),
      //         ],
      //       );
      //     }
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return const Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //     else{
      //       var articleList=snapshot.data?.articles ?? [];
      //       return Expanded(
      //         child: ListView.builder(itemBuilder: (context, index) {
      //           return ArticleView(articleList[index]);
      //         },
      //         itemCount: 10,),
      //       );
      //     }
      //   },);

  }
}
