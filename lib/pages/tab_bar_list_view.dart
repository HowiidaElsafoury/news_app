import 'package:flutter/material.dart';
import 'package:news_app/models/source_model.dart';
import 'package:news_app/widgets/article_list_view.dart';
import 'package:news_app/widgets/tab_item.dart';

class TabBarListView extends StatefulWidget {
  SourceModel sourceModel;

  TabBarListView(this.sourceModel, {super.key});

  @override
  State<TabBarListView> createState() => _TabBarListViewState();
}

class _TabBarListViewState extends State<TabBarListView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          initialIndex: selectedIndex,
          length: widget.sourceModel.sources?.length ?? 0,
          child: TabBar(
            labelPadding: const EdgeInsets.symmetric(horizontal: 4),
            indicator:
                const BoxDecoration(border: Border(bottom: BorderSide.none)),
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            isScrollable: true,
            tabs: widget.sourceModel.sources?.map((element) {
                  return TabItem(
                      element,
                      selectedIndex ==
                          widget.sourceModel.sources!.indexOf(element));
                }).toList() ??
                [],
          ),
        ),
       ArticleListView(widget.sourceModel.sources?[selectedIndex].id ?? "")
      ],
    );
  }
}
