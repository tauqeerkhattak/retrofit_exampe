import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:retrofit_example/api/products_api.dart';

import '../models/product.dart';

class ProductService {
  late ProductsApi _api;
  ProductService.init() {
    final dio = Dio();
    _api = ProductsApi(dio);
  }

  Future<List<Product>> getProducts() async {
    final products = await _api.getProducts();
    log('Products: ${products.length}');
    return products;
  }
}
