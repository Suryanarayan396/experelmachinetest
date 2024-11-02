import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'singleproduct_event.dart';
part 'singleproduct_state.dart';

class SingleproductBloc extends Bloc<SingleproductEvent, SingleproductState> {
  SingleproductBloc() : super(SingleproductInitial()) {
    on<SingleproductEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
