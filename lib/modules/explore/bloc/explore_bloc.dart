import 'dart:async';

import 'package:airbnb___/modules/explore/model/products_model.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:airbnb___/modules/explore/model/category_model.dart';
import 'package:airbnb___/modules/explore/service/explore_service.dart';
import 'package:airbnb___/utils/status.dart';

part 'explore_event.dart';
part 'explore_state.dart';

class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  ExploreBloc() : super(const ExploreState()) {
    on<CategoryGetEvent>(_getCategories);
    add(CategoryGetEvent());
    on<GetProductsEvent>(_getProducts);
    add(GetProductsEvent());
  }

  final ExploreServce _exploreService = ExploreServce();

  Future<FutureOr<void>> _getCategories(
      CategoryGetEvent event, Emitter<ExploreState> emit) async {
    emit(state.copyWith(status: ActionStatus.isLoading));
    Either<String, List<CategoryModel>> res = await _exploreService.getData();
    res.fold(
        (l) => emit(state.copyWith(status: ActionStatus.isError, error: l)),
        (r) => emit(
            state.copyWith(status: ActionStatus.isSuccess, categoryModel: r)));
  }

  FutureOr<void> _getProducts(
      GetProductsEvent event, Emitter<ExploreState> emit) async {
    emit(state.copyWith(status: ActionStatus.isLoading));
    Either<String, List<ProductsModel>> res =
        await _exploreService.getProducts();
    res.fold(
        (l) => emit(state.copyWith(status: ActionStatus.isError, error: l)),
        (r) {
      emit(state.copyWith(status: ActionStatus.isSuccess, productsModel: r));
      print(r.length);
      print(r);
    });
  }
}
