part of 'brands_cubit.dart';

@immutable
sealed class BrandsState {}

final class BrandsInitial extends BrandsState {}

final class BrandsLoading extends BrandsState {}

final class BrandsSuccess extends BrandsState {
  final BrandResponse brand;

  BrandsSuccess({required this.brand});
}

final class BrandsFailure extends BrandsState {
  final String errorMessage;
  BrandsFailure({required this.errorMessage});
}
