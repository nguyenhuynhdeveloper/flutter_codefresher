import 'package:flutter/material.dart';
import 'package:flutter_18/Lesson6/pages/ecommerce_page/components/recent_products/recent_products_item.dart';
import 'package:flutter_18/Lesson6/pages/ecommerce_page/components/showcase_panel.dart';

class RecentProducts extends StatelessWidget {
  const RecentProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ShowcasePannel(
      panelName: 'Recent Products',
      showViewAll: true,
      showcaseItemCount: 10,
      showcaseItem: RecentProductsItem(
        imageUrl:
            'https://www.dshop.com.au/assets/full/BG01-O.jpg?20210318030136',
        name: 'Drawer Table',
        icon: Icon(
          Icons.shopping_cart,
          color: Colors.black,
        ),
      ),
      showcaseItemPadding: EdgeInsets.all(15.0),
      showcaseScrollDirection: Axis.vertical,
      listItemsBackgroundColor: Colors.white60,
    );
  }
}
