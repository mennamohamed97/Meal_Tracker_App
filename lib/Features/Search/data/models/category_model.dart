import 'package:mennaallah_mohamed/Features/Search/domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel({required super.name, required super.imageUrls});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    String categoryName = json['strCategory'];
    return CategoryModel(
      name: categoryName,
      imageUrls: _getImagesForCategory(categoryName),
    );
  }

  static String _getImagesForCategory(String category) {
    Map<String, String> categoryImages = {
      "Beef": "https://cdn-icons-png.flaticon.com/512/9482/9482648.png",
      "Breakfast": "https://cdn-icons-png.flaticon.com/512/3480/3480823.png",
      "Chicken": "https://cdn-icons-png.flaticon.com/512/821/821023.png",
      "Dessert": "https://cdn-icons-png.flaticon.com/512/992/992754.png",
      "Goat": "https://cdn-icons-png.flaticon.com/512/1998/1998662.png",
      "Lamb": "https://cdn-icons-png.flaticon.com/512/2711/2711858.png",
      "Miscellaneous": "https://cdn-icons-png.flaticon.com/512/2515/2515271.png",
      "Pasta": "https://cdn-icons-png.flaticon.com/512/4465/4465494.png",
      "Pork": "https://cdn-icons-png.flaticon.com/512/8692/8692065.png",
      "Seafood": "https://cdn-icons-png.flaticon.com/512/2346/2346897.png",
      "Side": "https://cdn-icons-png.flaticon.com/512/11790/11790114.png",
      "Starter": "https://cdn-icons-png.flaticon.com/512/1755/1755753.png",
      "Vegan": "https://cdn-icons-png.flaticon.com/512/2515/2515183.png",
      "Vegetarian": "https://cdn-icons-png.flaticon.com/512/2805/2805947.png",
    };

    return categoryImages[category] ?? "https://cdn-icons-png.flaticon.com/512/3859/3859737.png";
  }
}
