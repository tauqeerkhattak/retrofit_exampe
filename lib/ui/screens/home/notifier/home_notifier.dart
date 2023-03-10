import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit_example/services/product_service.dart';

import '../../../../utils/service_locator.dart';
import 'home_states.dart';

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier() : super(LoadingHomeState()) {
    log("Home Notifier initialized!");
  }

  Future<void> getData() async {
    try {
      final products = await getIt<ProductService>().getProducts();
      state = SuccessHomeState(products);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      state = ErrorHomeState(e.toString());
    }
  }
}
