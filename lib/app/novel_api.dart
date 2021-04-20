import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MovieApi {
  static const String baseUrl = 'http://api.zhuishushenqi.com/';
  var dio = MovieApi.createDio();

  static Dio createDio() {
    var options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 10000,
      receiveTimeout: 100000,
    );
    return Dio(options);
  }

  ///获取小说类别列表
  Future<dynamic> getGenreList({leve = 9, pagesize = 5}) async {
    Response<Map> response;
    try {
      response = await dio.get('cats/lv2');
    } catch (e) {
      Fluttertoast.showToast(msg: '网络异常');
      return null;
    }
    return response.data;
  }
}