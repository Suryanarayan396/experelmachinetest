part of 'product_bloc.dart';

class ProductState {
  List<Product>? product = [];
  ProductState({required this.product});
}

final class ProductInitial extends ProductState {
  ProductInitial({required super.product});
}
