import '../../../../models/product.dart';

abstract class HomeState {}

class LoadingHomeState extends HomeState {}

class SuccessHomeState extends HomeState {
  List<Product> products;

  SuccessHomeState(this.products);
}

class ErrorHomeState extends HomeState {
  String message;

  ErrorHomeState(this.message);
}
