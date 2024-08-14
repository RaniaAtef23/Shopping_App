part of 'fetch_product_cubit.dart';

@immutable
sealed class FetchProductState {}


final class FetchProductInitial extends FetchProductState {}
final class FetchProductLoading extends FetchProductState {}
final class FetchProductSuccess extends FetchProductState {
  final List<Products> products;

  FetchProductSuccess(this.products);

}
final class FetchProductFailure extends FetchProductState {
  final String error;

  FetchProductFailure(this.error);
}
