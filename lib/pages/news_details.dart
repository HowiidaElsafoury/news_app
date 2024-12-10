import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/models/source_model.dart';
import 'package:news_app/pages/articles_view.dart';
import 'package:news_app/widgets/tab_item.dart';

import '../bussiness_logic/cubit/cubit.dart';
import '../bussiness_logic/cubit/states.dart';

class NewsDetails extends StatefulWidget {
  CategoryModel categoryModel;

  NewsDetails(this.categoryModel, {super.key});

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
        HomeCubit()..getSource(widget.categoryModel.categoryId),
        child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
      if (state is HomeSourceSuccessState) {
        HomeCubit.get(context).getArticals(HomeCubit.get(context)
            .sourceList[HomeCubit.get(context).selectedIndex]
            .id);
      }
    },
    builder: (context, state) {
    var cubit = HomeCubit.get(context);
    return DefaultTabController(
    length: cubit.sourceList.length,
    child: Column(
    children: [
    TabBar(
    labelPadding: const EdgeInsets.symmetric(horizontal: 4),
    indicator: const BoxDecoration(
    border: Border(
    bottom: BorderSide.none,
    ),
    ),
    isScrollable: true,
    onTap: (int index) {
    cubit.changeIndexState(index);
    cubit.getArticals(cubit.sourceList[cubit.selectedIndex].id);
    },
    tabs: cubit.sourceList
        .map((element) => TabItem(
    element,
    cubit.selectedIndex ==
    cubit.sourceList.indexOf(element),
    ))
        .toList(),
    ),
    Expanded(
    child: ListView.builder(
    padding: EdgeInsets.all(20),
    itemBuilder: (context, index) =>
    ArticleView(articles: cubit.articlesList[index]),
    itemCount: cubit.articlesList.length,
    ),
    ),
    ],
    ),
    );
    },
    ),
    );
  }
}
