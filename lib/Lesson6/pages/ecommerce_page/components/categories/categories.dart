import 'package:flutter/material.dart';
import 'package:flutter_18/Lesson6/pages/ecommerce_page/components/categories/categories_item.dart';
import 'package:flutter_18/Lesson6/pages/ecommerce_page/components/showcase_panel.dart';

class Categories extends StatelessWidget {
  const Categories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ShowcasePannel(
      panelName: 'Categories',
      showcaseItemCount: 10,
      showcaseItem: CategoriesItem(
        imageUrl:
            'https://t4.ftcdn.net/jpg/00/96/62/35/240_F_96623550_qlTc19zSHebvVyWdp4McjGI0w7zzFetw.jpg',
        name: 'Table',
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      showcaseItemPadding: EdgeInsets.only(right: 10.0),
      showcaseHeight: 190,
    );
  }
}
