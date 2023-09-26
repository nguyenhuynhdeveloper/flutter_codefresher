import 'package:flutter/material.dart';
import '../../../../widgets/square_image.dart';

class RecentProductsItem extends StatelessWidget {
  const RecentProductsItem({
    Key? key,
    required this.imageUrl,
    this.imageSize = 150,
    this.imageRadius = const BorderRadius.all(Radius.circular(0)),
    required this.name,
    required this.icon,
    this.borderRadius = const BorderRadius.all(Radius.circular(20)),
    this.onPressedButton,
  }) : super(key: key);
  final String imageUrl;
  final double? imageSize;
  final BorderRadius? imageRadius;

  final String name;
  final Icon icon;
  final BorderRadius? borderRadius;
  final Function()? onPressedButton;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: Container(
        margin: const EdgeInsets.only(bottom: 3.0, right: 3.0),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 3.0,
            ),
          ],
          borderRadius: borderRadius,
        ),
        child: Row(
          children: [
            SquareImage(
              imageUrl: imageUrl,
              size: imageSize,
              borderRadius: imageRadius,
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Rs. 8000',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: IconButton(onPressed: onPressedButton, icon: icon),
            ),
          ],
        ),
      ),
    );
  }
}
