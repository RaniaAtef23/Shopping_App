import 'package:animal_app/features/Home/data/models/Products.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/repo/home_repo.dart';

part 'fetch_product_state.dart';

class FetchProductCubit extends Cubit<FetchProductState> {
  HomeRepo home_repo;
  FetchProductCubit(this.home_repo) : super(FetchProductInitial());
  Fetch_all_products()async{
    FetchProductLoading();
    var result=await home_repo.FetchProduct();
    result.fold((l) => emit(FetchProductFailure(l.error)), (r) =>emit(FetchProductSuccess(r)));

  }
}
