import 'package:flutter_18/l6_StateFullWidget_ecommerce_app/components/price_row.dart';
import 'package:flutter_18/l6_StateFullWidget_ecommerce_app/models/product_model.dart';
import 'package:flutter_18/l6_StateFullWidget_ecommerce_app/utils/device_parameters.dart';
import 'package:flutter_18/l6_StateFullWidget_ecommerce_app/widgets/custom_container.dart';
import 'package:flutter_18/l6_StateFullWidget_ecommerce_app/widgets/custom_text.dart';
import 'package:flutter_18/l6_StateFullWidget_ecommerce_app/widgets/round_image.dart';
import 'package:flutter/material.dart';

class ProductPanel extends StatefulWidget {
  ProductPanel({
    Key? key,
    required this.onPressed,
    required this.onPressedFavoriteButton,
    //this.isFavorite = false,
  }) : super(key: key);

  final Function(ProductModel) onPressed;
  final Function()? onPressedFavoriteButton;

  @override
  State<ProductPanel> createState() => _ProductPanelState();
}

class _ProductPanelState extends State<ProductPanel> {
  late bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;

    //int crossAxisCount =

    // return Padding(
    //   padding: const EdgeInsets.only(right: 20.0),
    //   child: GridView.builder(
    //     shrinkWrap: true,
    //     physics: const NeverScrollableScrollPhysics(),
    //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //       crossAxisCount: _size.width < 600 ? 2 : 3,
    //       childAspectRatio: 0.6,
    //       crossAxisSpacing: 15,
    //       mainAxisSpacing: 15,
    //     ),
    //     itemCount: productionList.length,
    //     itemBuilder: (context, index) {
    //       ProductModel product = productionList[index];
    //       return buildProductItem(context, product, index);
    //     },
    //   ),
    // );

    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth < 600) {
            return _buildGridView(crossAxisCount: 2);
          } else {
            return _buildGridView(crossAxisCount: 3);
          }
        },
      ),
    );
  }

  Widget _buildGridView({required int crossAxisCount}) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: 0.6,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
      ),
      itemCount: productionList.length,
      itemBuilder: (context, index) {
        ProductModel product = productionList[index];
        return buildProductItem(context, product, index);
      },
    );
  }

  InkWell buildProductItem(
    BuildContext context,
    ProductModel product,
    int index,
  ) {
    return InkWell(
      onTap: () => widget.onPressed(product),
      child: CustomContainer(
        color: Colors.grey[350],
        borderRadius: 10,
        borderShadow: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 5.0),
                    child: CustomContainer(
                      borderRadius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: CustomText(
                          text: '30% OFF',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    //onPressed: onPressedFavoriteButton,
                    onPressed: () {
                      isFavorite = !isFavorite;
                      setState(() {});
                    },
                    icon: Icon(
                      Icons.favorite_rounded,
                      color: isFavorite ? Colors.red : Colors.grey,
                    ),
                  )
                ],
              ),
            ),
            RoundImage(
              imageAsset: product.image,
              width: DeviceParameters.screenWidth(context) / 2.75,
              aspectRatio: 0.9,
            ),
            Padding(
              padding: const EdgeInsets.all(2.5),
              child: CustomContainer(
                borderRadius: 5,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomText(
                        text: product.name,
                        textColor: Colors.grey[700],
                      ),
                      const SizedBox(height: 5),
                      PriceRow(
                        saleOffPrice: product.currentPrice,
                        originalPrice: product.originalPrice,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
