part of 'search_product_cubit.dart';

@immutable
sealed class SearchProductState {}

final class SearchProductInitial extends SearchProductState {}

final class SearchProductLoading extends SearchProductState {}

final class SearchProductSuccess extends SearchProductState {}

final class SearchProductError extends SearchProductState {
  final String message;
  SearchProductError(this.message);
}
