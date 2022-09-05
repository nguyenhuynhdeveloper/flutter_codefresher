import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/product_state.dart';
import '../../../components/price_row.dart';
import '../../../models/product_model.dart';
import '../../../widgets/custom_text.dart';

class ProductionDetail extends StatelessWidget {
  const ProductionDetail({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildNameRow(product),
          const SizedBox(height: 20),
          _buildStarBar(),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PriceRow(
                saleOffPrice: product.saleOffPrice,
                originalPrice: product.originalPrice,
              ),
              const CustomText(
                text: 'Available in stock',
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
          const SizedBox(height: 50),
          const CustomText(
            text: 'About',
            size: 18,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(height: 20),
          CustomText(
            text: product.description,
          ),
        ],
      ),
    );
  }

  Row _buildNameRow(ProductModel product) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: product.name,
          fontWeight: FontWeight.bold,
          size: 20,
        ),
        Consumer<ProductState>(builder: (context, value, child) {
          int index = value.productionList.indexOf(product);
          Color color = value.productionList.elementAt(index).isFavorited
              ? Colors.red
              : Colors.grey;
          return OutlinedButton(
            onPressed: () => productState.changeFavorite(index),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.favorite_sharp,
                  color: color,
                ),
                const SizedBox(width: 5),
                CustomText(
                  text: 'Favorite',
                  textColor: color,
                ),
              ],
            ),
          );
        })
      ],
    );
  }

  Row _buildStarBar() {
    return Row(
      children: [
        for (int i = 0; i < 5; i++)
          const Icon(
            Icons.star,
            color: Colors.yellow,
          ),
        const SizedBox(width: 30),
        const Text('(4500 Reviews)'),
      ],
    );
  }
}
