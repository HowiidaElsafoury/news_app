import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/pages/news_view.dart';
import 'package:news_app/widgets/custom_drawer.dart';

import '../../widgets/category_item.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});
  static String routeName = "home";

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<CategoryModel> categories = [];
  CategoryModel? selectedCategory;

  @override
  void initState() {
    super.initState();
    selectedCategory= null;
    categories=[
    CategoryModel(
      categoryId: "sports",
      categoryTitle: "Sports",
      categoryImage: "assets/images/sports@3x.png",
      categoryColor: const Color(0xFFC91C22),
    ),
    CategoryModel(
    categoryId: "politics",
    categoryTitle: "Politics",
    categoryImage: "assets/images/Politics.png",
    categoryColor: const Color(0xFF003E90),
    ),
    CategoryModel(
    categoryId: "health",
    categoryTitle: "Health",
    categoryImage: "assets/images/health@3x.png",
    categoryColor: const Color(0xFFED1E79),
    ),
    CategoryModel(
    categoryId: "bussines",
    categoryTitle: "Bussines",
    categoryImage: "assets/images/bussines.png",
    categoryColor: const Color(0xFFCF7E48),
    ),
    CategoryModel(
    categoryId: "environment",
    categoryTitle: "Environment",
    categoryImage: "assets/images/environment.png",
    categoryColor: const Color(0xFF4882CF),
    ),
    CategoryModel(
    categoryId: "science",
    categoryTitle: "Science",
    categoryImage: "assets/images/science@3x.png",
    categoryColor: const Color(0xFFF2D352),
    ),
    ];
  }
  onSelectedCategoryItem(CategoryModel categoryModel) {


    setState(() {
      selectedCategory = categoryModel;
    });
  }
  onDrawerCategoryClicked(){
    Navigator.pop(context);
    selectedCategory= null;
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            image: AssetImage("assets/images/pattern@3x.png"),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: selectedCategory == null ?Text(
            "News App",
            style: theme.textTheme.titleMedium,
          ): Text(selectedCategory!.categoryTitle),
        ),
        drawer:  CustomDrawer(
          onCategoryClicked:onDrawerCategoryClicked ,
        ),
        body:  selectedCategory == null ? Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
             Text(
                'Pick your category \n of interest',
                textAlign: TextAlign.start,
                style: theme.textTheme.titleLarge!
                    .copyWith(color: const Color(0xFF4F5A69)),
              ),
              Expanded(
                child:Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GridView.builder(
                    gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 9/11),
                    itemBuilder: (context, index) => CategoryItem(
                      categoryModel: categories[index],
                      index: index,
                      onSelectedItem: (){
                        onSelectedCategoryItem(categories[index]);
                      },
                    ),
                    itemCount: categories.length,
                  ),
                ),
              )
            ],
          ),
        ): CategoryView(categoryModel:selectedCategory! ,),
      ),
    );
  }




}

