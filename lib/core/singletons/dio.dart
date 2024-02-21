import 'package:airbnb___/core/constants/app_urls.dart';
import 'package:airbnb___/core/constants/keys.dart';
import 'package:airbnb___/core/constants/server.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DioSettings {
  final BaseOptions _dioBaseOptions = BaseOptions(
    baseUrl: Server.server,
    connectTimeout: const Duration(seconds: 35),
    receiveTimeout: const Duration(seconds: 35),
    contentType: 'application/json',
    validateStatus: (status) =>
        status != null && status >= 100 && status <= 599,
    // headers: {
    //   'Content-Type': 'application/json',
    //   'Authorization': "Bearer ${await accessToken}"
    // },
  );

  BaseOptions get dioBaseOptions => _dioBaseOptions;

  Dio get dio {
    var dio1 = Dio(_dioBaseOptions)
      ..interceptors.add(InterceptorsWrapper(
        onError: (DioException e, ErrorInterceptorHandler handler) async {
          print('Interceptor OnError');
          if (e.response?.statusCode == 401) {
            print('Refresh Token');
            var responseRefresh = await Dio().post(AppUrls.tokenRefresh, data: {
              "token": await FlutterSecureStorage().read(key: Keys.refresh),
              "type": "refresh",
            });
            if (responseRefresh.statusCode! >= 200 &&
                responseRefresh.statusCode! < 300) {
              FlutterSecureStorage().write(
                  key: Keys.access, value: responseRefresh.data['access']);
              FlutterSecureStorage().write(
                  key: Keys.refresh, value: responseRefresh.data['refresh']);
              handler.next(e);
            } else {
              // Handle refresh token failure
              // You might want to throw an error or handle it accordingly
            }
          } else {
            handler.next(e);
          }
        },
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          print('Interceptor OnRequest');

          options.headers.addAll({'Accept-Language': "uz"});
          handler.next(options);
        },
        // onResponse:
        //     (Response response, ResponseInterceptorHandler handler) async {
        //   print('Interceptor OnResponse');
        //   // Modify response here if needed
        //   handler.next(response);
        // },
      ));
    return dio1;
  }
}
