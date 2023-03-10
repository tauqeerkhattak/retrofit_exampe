import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit_example/models/product.dart';

part 'products_api.g.dart';

@RestApi(baseUrl: 'https://fakestoreapi.com/')
abstract class ProductsApi {
  factory ProductsApi(Dio dio) = _ProductsApi;

  @GET('/products')
  Future<List<Product>> getProducts();
}
