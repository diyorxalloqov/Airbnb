import 'package:airbnb___/core/constants/app_urls.dart';
import 'package:airbnb___/core/singletons/dio.dart';
import 'package:airbnb___/core/singletons/locator.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AuthService {
  final Dio client = serviceLocator<DioSettings>().dio;
  Future<Either<String, String>> login(String token) async {
    try {
      print('authservice $token');
      Response response =
          await client.post(AppUrls.login, data: {"auth_token": token});
      if (response.statusCode == 200) {
        print(response.data);
        print(response.statusMessage);
        print(response.statusCode);
        return right('Succes');
      } else if (response.statusCode == 400) {
        return left(response.statusMessage.toString());
      } else {
        print('error');
        print(response.statusMessage);
        return left(response.statusMessage.toString());
      }
    } on DioException catch (e) {
      print(e.response!.statusCode);
      print('exeption');
      print(e.message);
      return left(e.message.toString());
    }
  }

  Future<Either<String, String>> logOut() async {
    try {
      Response response = await client.get(AppUrls.logOut);
      if (response.statusCode == 200) {
        print(response.data);
        return right('Succes');
      } else {
        return left(response.statusMessage.toString());
      }
    } on DioException catch (e) {
      return left(e.message.toString());
    }
  }
}
