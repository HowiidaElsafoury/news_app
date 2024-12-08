import 'package:flutter/material.dart';
import 'package:news_app/models/source_model.dart';
import 'package:news_app/pages/home/home_model_view.dart';
import 'package:news_app/widgets/article_list_view.dart';
import 'package:news_app/widgets/tab_item.dart';
import 'package:provider/provider.dart';

import 'article_view.dart';

class NewsDetails extends StatefulWidget {
  final List<Source> sourcesList;

  NewsDetails({required this.sourcesList});

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  int selectedIndex = 0;
  var vm = HomeViewModel();
  @override
  void initState() {
    vm.getArticles(widget.sourcesList[selectedIndex].id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => vm,
      builder: (context, child) {
        return Consumer<HomeViewModel>(
          builder: (context, value, child) {
            return DefaultTabController(
                length: widget.sourcesList.length ?? 0,
                child: Column(
                  children: [
                    TabBar(
                      labelPadding: const EdgeInsets.symmetric(horizontal: 4),
                      indicator: const BoxDecoration(
                          border: Border(bottom: BorderSide.none)),
                      onTap: (index) {
                        selectedIndex = index;
                        setState(() {

                        });
                      },
                      isScrollable: true,
                      tabs: widget.sourcesList.map((element) {
                            return TabItem(
                                element,
                                selectedIndex ==
                                    widget.sourcesList.indexOf(element));
                          }).toList() ,
                    ),
                    vm.articlesList.isEmpty
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : Expanded(
                            child: ListView.builder(
                              itemBuilder: (context, index) {
                                return ArticleView(vm.articlesList[index]);
                              },
                              itemCount: vm.articlesList.length,
                            ),
                          ),
                  ],
                ));
          },
        );
      },
    );
  }
}
