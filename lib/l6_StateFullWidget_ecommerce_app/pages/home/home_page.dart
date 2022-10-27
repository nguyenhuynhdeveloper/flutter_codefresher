import '../../constants/img_string.dart';
import '../../pages/cart/data/cart_state.dart';
import 'package:flutter/material.dart';
import '../../components/custom_appbar.dart';
import '../../components/badge_button.dart';
import '../../pages/cart/cart_page.dart';
import '../../pages/home/components/hello_panel.dart';
import '../../pages/home/components/sale_off_panel.dart';
import '../../pages/home/components/categories_panel.dart';
import '../../pages/home/components/product_panel.dart';
import '../../pages/production/production_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = "homePage";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _reload() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    double width = _size.width;
    double height = _size.height;

    print('Current Screen size: width - $width , height - $height');

    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: CustomAppBar(
          leading:
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.home,
              size: 32,
            ),
          ),
          action: [         // Giỏ hàng ở ô bên phải của thanh appBar
            BadgeButton(
              badgeCount: cartState.totalItems,
              onPressedBadgeButton: () {
                Navigator.of(context)
                    .pushNamed(CartPage.routeName)
                    .then((value) => _reload());
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10),

                const HelloPanel(userName: 'Rocky'),   // ô chào khách hàng

                const SizedBox(height: 25),

                SaleOffPanel(    // Thanh ngang sản phẩm giảm giá
                  saleOffImage: ImgString.appleWatchImg,
                  onPressed: () {},
                ),
                const SizedBox(height: 25),

                CategoriesPanel(   // Thanh ngang sản phẩm ưu thích
                  onPressedSeeAll: () {},
                  onPressedIcon: () {},
                ),
                const SizedBox(height: 25),

                ProductPanel(    //Thang ngang sản phẩm
                  onPressed: (product) {
                    print('Product: ${product.name}');
                    Navigator.of(context)
                        .pushNamed(
                          ProductionPage.routeName,
                          arguments: product,
                        )
                        .then((value) => _reload());
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
