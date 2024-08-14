

import 'package:animal_app/features/Home/data/models/Products.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failers.dart';

abstract class HomeRepo{

  Future<Either<failers,List<Products>>> FetchProductCategory(String category);
  Future<Either<failers,List<Products>>> FetchProduct();
}