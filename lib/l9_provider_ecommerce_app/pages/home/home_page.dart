import 'package:flutter/material.dart';
import '../../constants/img_string.dart';
import '../../components/custom_appbar.dart';
import '../production/production_page.dart';
import 'components/hello_panel.dart';
import 'components/categories_panel.dart';
import 'components/product_panel.dart';
import 'components/sale_off_panel.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = "HomePage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: const Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: HelloPanel(userName: 'Rocky'),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 15),
                SaleOffPanel(
                  saleOffImage: ImgString.appleWatchImg,
                  onPressed: () {},
                ),
                const SizedBox(height: 25),
                CategoriesPanel(
                  onPressedSeeAll: () {},
                  onPressedIcon: () {},
                ),
                const SizedBox(height: 25),
                ProductPanel(
                  onPressed: (product) {
                    Navigator.of(context).pushNamed(
                      ProductionPage.routeName,
                      arguments: product,
                    );
                  },
                  onPressedFavoriteButton: () {},
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
