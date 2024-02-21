part of 'explore_bloc.dart';

@immutable
class ExploreState extends Equatable {
  final List<CategoryModel> categoryModel;
  final List<ProductsModel> productsModel;
  final ActionStatus status;
  final String error;

  const ExploreState(
      {this.categoryModel = const [],
      this.productsModel = const [],
      this.error = '',
      this.status = ActionStatus.isInitial});

  ExploreState copyWith(
      {List<CategoryModel>? categoryModel,
      ActionStatus? status,
      List<ProductsModel>? productsModel,
      String? error}) {
    return ExploreState(
      categoryModel: categoryModel ?? this.categoryModel,
      error: error ?? this.error,
      productsModel: productsModel ?? this.productsModel,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [categoryModel, productsModel, status, error];
}
