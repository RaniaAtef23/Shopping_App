import 'package:animal_app/features/Home/data/repo/home_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/Products.dart';

part 'product_category_state.dart';


class ProductCategoryCubit extends Cubit<ProductCategoryState> {
  final HomeRepo homeRepo;
  final String category;

  ProductCategoryCubit(this.homeRepo, this.category) : super(ProductCategoryInitial());

  Future<void> FetchProductCategory() async {
    emit(ProductCategoryLoading());
    final result = await homeRepo.FetchProductCategory(category);
    result.fold(
          (failure) => emit(ProductCategoryFailure(failure.error)),
          (products) => emit(ProductCategorySuccess(products)),
    );
  }
}