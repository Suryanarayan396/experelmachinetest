import 'package:experelmachinetest/model/singleproduct_model.dart';

abstract class SingleproductState {}

final class SingleproductInitial extends SingleproductState {}

class ProductDetailLoading extends SingleproductState {}

class ProductDetailLoaded extends SingleproductState {
  final Singleproductmodel singleproduct;
  ProductDetailLoaded(this.singleproduct);
}

class ProductDetailError extends SingleproductState {
  final String error;
  ProductDetailError(this.error);
}
