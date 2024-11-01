import 'package:bloc/bloc.dart';
import 'package:experelmachinetest/model/product_model.dart';
import 'package:experelmachinetest/services/apiservice.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc(Apiservice apiservice) : super(ProductInitial(product: [])) {
    on<Fetch>((event, emit) async {
      Apiservice apiservice = Apiservice();
      var list = await apiservice.fetchdata();
      emit(ProductState(product: list));
    });
  }
}
