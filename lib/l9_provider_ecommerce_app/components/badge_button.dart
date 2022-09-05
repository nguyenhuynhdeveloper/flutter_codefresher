import 'package:flutter/material.dart';
import '../widgets/custom_text.dart';

class BadgeButton extends StatelessWidget {
  const BadgeButton({
    Key? key,
    required this.badgeCount,
    required this.onPressedBadgeButton,
    this.hideZero = true,
    this.badgeMaxCount = 99,
  }) : super(key: key);

  final int badgeCount;
  final Function()? onPressedBadgeButton;
  final bool hideZero;
  final int badgeMaxCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onPressedBadgeButton,
        child: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            const Icon(
              Icons.shopping_cart,
              // color: Colors.black,
              size: 32,
            ),
            Visibility(
              visible: hideZero ? badgeCount > 0 : true,
              child: Container(
                width: 20,
                height: 20,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: CustomText(
                  textColor: Colors.white,
                  text: badgeCount <= badgeMaxCount
                      ? badgeCount.toString()
                      : '...',
                  size: 10,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
