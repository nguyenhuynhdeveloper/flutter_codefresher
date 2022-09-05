import 'package:flutter_18/l6_StateFullWidget_ecommerce_app/pages/cart/data/cart_state.dart';
import 'package:flutter_18/l6_StateFullWidget_ecommerce_app/utils/device_parameters.dart';
import 'package:flutter_18/l6_StateFullWidget_ecommerce_app/widgets/custom_text.dart';
import 'package:flutter_18/l6_StateFullWidget_ecommerce_app/widgets/round_button.dart';
import 'package:flutter/material.dart';

class CheckOutPanel extends StatelessWidget {
  const CheckOutPanel({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: DeviceParameters.screenHeight(context) / 7.5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomText(text: 'Total', size: 20),
                CustomText(
                  text: '\$${cartState.totalPrice}',
                  textColor: Colors.deepOrange,
                  size: 20,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            RoundButton(
              onPressed: onPressed,
              height: 50,
              borderRadius: 20,
              text: 'Buy Now',
              buttonColor: Colors.deepOrange,
              textColor: Colors.white,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
