import 'package:airbnb___/core/config/network_exeptions.dart';
import 'package:airbnb___/core/constants/app_urls.dart';
import 'package:airbnb___/core/singletons/dio.dart';
import 'package:airbnb___/core/singletons/locator.dart';
import 'package:airbnb___/modules/explore/model/category_model.dart';
import 'package:airbnb___/modules/explore/model/products_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ExploreServce {
  final Dio client = serviceLocator<DioSettings>().dio;
  Future<Either<String, List<CategoryModel>>> getData() async {
    try {
      Response response = await client.get(AppUrls.categoryGet);
      if (response.statusCode == 200) {
        print(response.data);
        List<CategoryModel> data = (response.data as List)
            .map((e) => CategoryModel.fromJson(e))
            .toList();
        return right(data);
      } else if (response.statusCode == 500) {
        return left('Server not working');
      } else {
        print(response.statusMessage);
        return left(response.statusMessage.toString());
      }
    } on DioException catch (e) {
      print('exeption');
      print(e.message);
      return left(NetworkExeptionResponse(e).messageForUser);
    }
  }

  Future<Either<String, List<ProductsModel>>> getProducts() async {
    try {
      Response response = await client.get(AppUrls.productsGet);
      if (response.statusCode == 200) {
        print(response.data);
        List<ProductsModel> data = (response.data as List)
            .map((e) => ProductsModel.fromJson(e))
            .toList();
        return right(data);
      } else if (response.statusCode == 500) {
        return left('Server not working');
      } else {
        print(response.statusMessage);
        return left(response.statusMessage.toString());
      }
    } on DioException catch (e) {
      print('exeption');
      print(e.message);
      return left(NetworkExeptionResponse(e).messageForUser);
    }
  }
}
