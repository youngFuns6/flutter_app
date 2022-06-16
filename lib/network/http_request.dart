import 'package:dio/dio.dart';

class HttpRequest {
  static final BaseOptions options = BaseOptions(
    baseUrl: 'https://api.youddian.com/api',
    connectTimeout: 3000
  );

  static Dio dio = Dio(options);

  static Future<T> request<T>(String url, {
    String method = 'get',
    Map<String, dynamic>? params,
    Interceptor? inter
  }) async {
    final options = Options(method: method);

    Interceptor dInter = InterceptorsWrapper(
      onRequest: (requestOpt, handler){
        return handler.next(requestOpt);
      },
      onResponse: (response, handler){
        return handler.next(response);
      },
      onError: (err, handler){
        handler.next(err);
      }
    );

    List<Interceptor> inters = [dInter];

    if(inter != null){
      inters.add(inter);
    }

    dio.interceptors.addAll(inters);
    
    try {
      Response response = await dio.request(url, queryParameters: params, options: options);
      return response.data;
    } on DioError catch(err){
      return Future.error(err);
    }
  }
}
