import 'package:bloc/bloc.dart';
import 'package:experelmachinetest/model/product_model.dart';
import 'package:experelmachinetest/view/homescreen_view/bloc/product/bloc/product_event.dart';
import 'package:experelmachinetest/view/homescreen_view/bloc/product/bloc/product_state.dart';
import 'package:experelmachinetest/services/apiservice.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final Apiservice apiservice;

  ProductBloc(this.apiservice) : super(ProductInitial()) {
    on<LoadProductsByCategory>(_onLoadProductsByCategory);
  }

  Future<void> _onLoadProductsByCategory(
      LoadProductsByCategory event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    try {
      final products = await apiservice.fetchProducts();

      // Group products by category
      final Map<String, List<Product>> productsByCategory = {};
      for (var product in products) {
        productsByCategory
            .putIfAbsent(product.category.toString(), () => [])
            .add(product);
      }

      emit(ProductLoaded(productsByCategory));
    } catch (error) {
      emit(ProductError("Failed to load products"));
    }
  }
}
