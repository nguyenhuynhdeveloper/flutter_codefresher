import 'package:flutter/material.dart';
import '../../../models/product_model.dart';
import '../../../utils/device_parameters.dart';
import '../../../widgets/round_button.dart';

class AddtoCartPanel extends StatelessWidget {
  const AddtoCartPanel({
    Key? key,
    required this.product,
    required this.onPressed,
    required this.onPressedSizeButton,
  }) : super(key: key);

  final ProductModel product;
  final Function()? onPressed;
  final Function()? onPressedSizeButton;

  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    return SizedBox(
      height: DeviceParameters.screenHeight(context) / 7.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 35,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(width: 30),
                  ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 30.0),
                        child: RoundButton(
                          text: product.size.toString(),
                          textColor: selectedIndex == index
                              ? Colors.deepOrange
                              : Colors.black,
                          buttonColor: selectedIndex == index
                              ? Colors.grey[400]
                              : Colors.grey[300],
                          onPressed: onPressedSizeButton,
                          borderRadius: 10,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
            child: RoundButton(
              onPressed: onPressed,
              height: 50,
              borderRadius: 20,
              text: 'Add to cart',
              buttonColor: Colors.deepOrange,
              textColor: Colors.white,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}
