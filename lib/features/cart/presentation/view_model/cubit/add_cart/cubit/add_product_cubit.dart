// ignore_for_file: depend_on_referenced_packages, strict_top_level_inference

import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:marketi/core/constants/strings/strings.dart';
import 'package:marketi/features/cart/data/models/product_model_cart.dart';
import 'package:meta/meta.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit() : super(AddProductInitial());
  addProduct(ProductResponseCart products) async {
    emit(AddProductLoading());
    try {
      var productBox = await Hive.openBox<ProductResponseCart>(product);
      productBox.add(products);
      emit(AddProductSuccess());
    } catch (e) {
      emit(AddProductFailure(message: e.toString()));
    }
  }
}
