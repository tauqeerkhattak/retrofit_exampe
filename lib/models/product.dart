import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit_example/models/enums/category.dart';

import 'enums/enum_helper.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  int id;
  String title;
  double price;
  String description;
  @JsonKey(toJson: categoryToJson, fromJson: categoryFromJson)
  ProductCategory category;
  String image;
  Rating rating;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return _$ProductFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProductToJson(this);
  }
}

@JsonSerializable()
class Rating {
  double rate;
  int count;

  Rating({required this.rate, required this.count});

  factory Rating.fromJson(Map<String, dynamic> json) {
    return _$RatingFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RatingToJson(this);
  }
}
