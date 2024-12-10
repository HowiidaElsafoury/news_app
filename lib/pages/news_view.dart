import 'package:flutter/material.dart';
import 'package:news_app/core/network_layer/api_manager.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/models/source_model.dart';
import 'package:news_app/pages/news_details.dart';

class CategoryView extends StatefulWidget {
  CategoryView({super.key, required this.categoryModel});
  CategoryModel categoryModel;

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: FutureBuilder<SourceModel>(
        future: ApiManager.fetchSources(widget.categoryModel.categoryId),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Column(
              children: [
                Text("${snapshot.error}"),
                IconButton(
                  onPressed: () {
                    ApiManager.fetchSources(widget.categoryModel.categoryId);;
                  },
                  icon: const Icon(Icons.refresh_outlined),
                ),
              ],
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            SourceModel? source = snapshot.data;
            return NewsDetails(widget.categoryModel);
          }
        },
      ),
    );
  }
}
