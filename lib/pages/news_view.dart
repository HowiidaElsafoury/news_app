import 'package:flutter/material.dart';
import 'package:news_app/core/network_layer/api_manager.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/models/source_model.dart';
import 'package:news_app/pages/home/home_model_view.dart';
import 'package:news_app/pages/news_details.dart';
import 'package:provider/provider.dart';

class NewsView extends StatefulWidget {
  CategoryModel categoryModel;

  NewsView({super.key, required this.categoryModel});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  var vm = HomeViewModel();
  @override
  void initState() {
    vm.getSources(widget.categoryModel.categoryId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ChangeNotifierProvider(
        create: (context) => vm,
        builder: (context, child) {
          return Consumer<HomeViewModel>(
              builder: ( context, vm,  child) =>vm.sourcesList.isEmpty ?
              const Center(child: CircularProgressIndicator(),)
              :NewsDetails(sourcesList: vm.sourcesList),
          );

        },
      ),
    );
    // FutureBuilder<SourceModel>(
    //   future: fetchSources,
    //   builder: (context, snapshot) {
    //     if (snapshot.hasError) {
    //       return Column(
    //         children: [
    //           Text("${snapshot.error}"),
    //           IconButton(
    //             onPressed: () {
    //               fetchSources;
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
    //     } else {
    //       SourceModel? source = snapshot.data;
    //       return TabBarListView(source!);
    //     }
    //   },
    // ),
  }
}
