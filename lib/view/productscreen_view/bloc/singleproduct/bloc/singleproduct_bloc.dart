import 'package:experelmachinetest/services/apiservice.dart';
import 'package:experelmachinetest/view/productscreen_view/bloc/singleproduct/bloc/singleproduct_event.dart';
import 'package:experelmachinetest/view/productscreen_view/bloc/singleproduct/bloc/singleproduct_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingleproductBloc extends Bloc<SingleproductEvent, SingleproductState> {
  final Apiservice apiService;

  SingleproductBloc(this.apiService) : super(ProductDetailLoading()) {
    on<FetchProductDetail>((event, emit) async {
      emit(ProductDetailLoading());
      try {
        await apiService.getproductdetail(id: event.productId);
        emit(ProductDetailLoaded(apiService.productobj!));
      } catch (e) {
        emit(ProductDetailError('Failed to load product details'));
      }
    });
  }
}
