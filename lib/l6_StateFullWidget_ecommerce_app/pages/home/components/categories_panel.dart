import 'package:flutter_18/l6_StateFullWidget_ecommerce_app/models/category_model.dart';
import 'package:flutter_18/l6_StateFullWidget_ecommerce_app/widgets/custom_container.dart';
import 'package:flutter_18/l6_StateFullWidget_ecommerce_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CategoriesPanel extends StatelessWidget {
  const CategoriesPanel({
    Key? key,
    required this.onPressedSeeAll,
    required this.onPressedIcon,
  }) : super(key: key);

  final Function()? onPressedSeeAll;
  final Function()? onPressedIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildTitledRow(),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 65,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: categoriesList.length,
                  itemBuilder: (context, index) {
                    int selectedIndex = 0;
                    CategoryModel category = categoriesList[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 15.0, bottom: 5),
                      child: buildCategoryItem(index, selectedIndex, category),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Row buildTitledRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CustomText(
          text: 'Top Categories',
          fontWeight: FontWeight.bold,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextButton(
            onPressed: onPressedSeeAll,
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.deepOrange),
            ),
            child: const Text('See all'),
          ),
        ),
      ],
    );
  }

  CustomContainer buildCategoryItem(
    int index,
    int selectedIndex,
    CategoryModel category,
  ) {
    return CustomContainer(
      width: 60,
      color: selectedIndex == index ? Colors.deepOrange : Colors.grey[350],
      borderRadius: 10,
      borderShadow: true,
      child: IconButton(
        icon: Image.asset(
          category.icon,
          color: selectedIndex == index ? Colors.white : Colors.grey[800],
        ),
        onPressed: onPressedIcon,
      ),
    );
  }
}
