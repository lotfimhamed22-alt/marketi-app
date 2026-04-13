part of 'all_product_cubit.dart';

@immutable
sealed class AllProductState {}

final class AllProductInitial extends AllProductState {}

final class AllProductLoading extends AllProductState {}

final class AllProductSuccess extends AllProductState {
  final ProductResponse productResponse;
  AllProductSuccess({required this.productResponse});
}

final class AllProductFailure extends AllProductState {
  final String errorMessage;

  AllProductFailure({required this.errorMessage});
}
