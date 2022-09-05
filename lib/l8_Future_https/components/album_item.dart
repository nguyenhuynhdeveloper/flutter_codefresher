import 'package:flutter/material.dart';
import '../widgets/custom_container.dart';
import '../widgets/custom_text.dart';
import '../widgets/round_image.dart';

class AlbumItem extends StatelessWidget {
  const AlbumItem({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  final String imageUrl;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      borderShadow: true,
      // height: 155,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: RoundImage(
              imageUrl: imageUrl,
              width: 150,
              height: 120,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomText(
                    text: title,
                    size: 32,
                  ),
                  CustomText(
                    text: subTitle,
                    // textOverflow: TextOverflow.ellipsis,
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
