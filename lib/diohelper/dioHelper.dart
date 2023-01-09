
import 'package:dio/dio.dart';

class DioHelper{

  static Dio? dio;

  static init(){
    dio=Dio(
      BaseOptions(
        baseUrl: "https://newsapi.org",
        receiveDataWhenStatusError: true
      )
    );
  }
  
  static Future<Response?> GetData({
  required path,
    required queryparameters,
}) async {
    //sortBy=publishedAt&apiKey=832d153146f241cdabf83ce2d661eefe&language=ar
    return await dio?.get(path,queryParameters: queryparameters);
  }
}