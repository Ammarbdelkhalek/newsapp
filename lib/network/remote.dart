import 'package:dio/dio.dart';

class Diohelper {
  static late Dio dio = Dio();

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://newsapi.org/',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getdate({
    required String url,
    required Map<String, dynamic> quary,
  }) async {
    return await dio.get(
      url,
      queryParameters: quary,
    );
  }
}

//  https://newsapi.org    (url)
/// v2/top-headlines?      (base url)
/// country=us&category=business&apiKey=4ce82e424b3d44bea574faab26c8e413(quaries)
