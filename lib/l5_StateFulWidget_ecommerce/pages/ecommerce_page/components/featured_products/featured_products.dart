import 'package:flutter/material.dart';
import '../../../../pages/ecommerce_page/components/featured_products/featured_products_items.dart';
import '../../../../pages/ecommerce_page/components/showcase_panel.dart';

class FeaturedProducts extends StatelessWidget {
  const FeaturedProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ShowcasePannel(
      panelName: 'Featured Products',
      showcaseItemCount: 10,
      showcaseHeight: 200,
      showcaseItem: FeaturedProductsItem(
        imageUrl: 'https://teaklab.com/wp-content/uploads/2019/08/4-14-1.jpg',
        name: 'Sofa Set',
        imageSize: 200,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      showcaseItemPadding: EdgeInsets.only(right: 20.0),
    );
  }
}
