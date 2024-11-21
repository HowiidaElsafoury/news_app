import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key,  required this.onCategoryClicked});
  final Function onCategoryClicked;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Container(
      color: Colors.white,
      width: mediaQuery.width*0.7,

      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width:mediaQuery.width*0.7,
            height: mediaQuery.height*0.13,
            color: theme.primaryColor,
            child: Text("News App !",style: theme.textTheme.titleLarge,),
          ),
          GestureDetector(
            onTap:(){
              onCategoryClicked(); },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.menu,size: 36,),
                  SizedBox(width: 10,),
                  Text("Categories",style: theme.textTheme.titleLarge!.copyWith(color: Colors.black),)
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.settings,size: 36,),
                SizedBox(width: 10,),
                Text("Settings",style: theme.textTheme.titleLarge!.copyWith(color: Colors.black),)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
