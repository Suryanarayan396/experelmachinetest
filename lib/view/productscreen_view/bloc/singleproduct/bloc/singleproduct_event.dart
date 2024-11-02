class SingleproductEvent {}

class FetchProductDetail extends SingleproductEvent {
  final int productId;
  FetchProductDetail(this.productId);
}
