import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/product_state.dart';
import '../../../components/price_row.dart';
import '../../../models/product_model.dart';
import '../../../utils/device_parameters.dart';
import '../../../widgets/custom_container.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/round_image.dart';

class ProductPanel extends StatelessWidget {
  const ProductPanel({
    Key? key,
    required this.onPressed,
    required this.onPressedFavoriteButton,
  }) : super(key: key);

  final Function(ProductModel) onPressed;
  final Function()? onPressedFavoriteButton;

  @override
  Widget build(BuildContext context) {
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
      itemCount: productState.productionList.length,
      itemBuilder: (context, index) {
        ProductModel product = productState.productionList[index];
        return _buildProductItem(context, product, index);
      },
    );
  }

  InkWell _buildProductItem(
    BuildContext context,
    ProductModel product,
    int index,
  ) {
    return InkWell(
      onTap: () => onPressed(product),
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
                  Consumer<ProductState>(
                    builder: (context, value, child) => IconButton(
                      onPressed: () => productState.changeFavorite(index),
                      icon: Icon(
                        Icons.favorite_rounded,
                        color: value.productionList[index].isFavorited
                            ? Colors.red
                            : Colors.grey,
                      ),
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
