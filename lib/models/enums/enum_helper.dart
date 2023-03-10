import 'package:retrofit_example/models/enums/category.dart';

categoryToJson(ProductCategory category) {
  switch (category) {
    case ProductCategory.electronics:
      return 'electronics';
    case ProductCategory.jewelery:
      return 'jewelry';
    case ProductCategory.menClothing:
      return 'men\'s clothing';
    case ProductCategory.womenClothing:
      return 'women\'s clothing';
  }
}

categoryFromJson(dynamic data) {
  switch (data) {
    case 'men\'s clothing':
      return ProductCategory.menClothing;
    case 'women\'s clothing':
      return ProductCategory.womenClothing;
    default:
      return ProductCategory.values.byName(data);
  }
}
