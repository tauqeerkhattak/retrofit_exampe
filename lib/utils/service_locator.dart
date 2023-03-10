import 'package:get_it/get_it.dart';
import 'package:retrofit_example/services/product_service.dart';

final getIt = GetIt.instance;

class ServiceLocator {
  static void init() {
    getIt.registerSingleton(ProductService.init());
  }
}
