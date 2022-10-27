import '../constants/img_string.dart';

class CategoryModel {
  CategoryModel({
    required this.name,
    required this.icon,
  });
  final String name;
  final String icon;


}

List<CategoryModel> categoriesList = [
  for (int i = 1; i <= 10; i++)
    CategoryModel(
      name: 'Watch',
      icon: ImgString.watchIcon,
    ),
];
