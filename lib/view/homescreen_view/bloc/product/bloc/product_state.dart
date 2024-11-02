import 'package:experelmachinetest/model/product_model.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final Map<String, List<Product>> productsByCategory;
  ProductLoaded(this.productsByCategory);
}

class ProductError extends ProductState {
  final String message;
  ProductError(this.message);
}
