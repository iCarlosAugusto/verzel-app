import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiHelper {
  Dio api = Dio(
    BaseOptions(baseUrl: "http://10.0.2.2:3000")
  );
  String? acessToken;
  final _storage = const FlutterSecureStorage();

  ApiHelper() {
    api.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        if(await _storage.containsKey(key: "acessToken")){
          acessToken = await _storage.read(key: "acessToken");
        }
        options.headers['Authorization'] = "Bearer $acessToken";
        return handler.next(options);
      },
      onError: (DioException error, handler) async {
        if(error.response?.statusCode == 401) {
          if(await _storage.containsKey(key: 'refreshToken')){
            await refreshToken();
            return handler.resolve(await _retry(error.requestOptions));
          }
        }
        return handler.next(error);
      }
    ));
  }

  _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return await api.request<dynamic>(
      requestOptions.path,
      data: {
        acessToken: acessToken
      },
      queryParameters: requestOptions.queryParameters,
      options: options
    );
  }

  Future<void> refreshToken() async {
    final refreshToken = await _storage.read(key: "refreshToken");
    final response = await api.post("/auth/refresh", data: {
      "refreshToken": refreshToken
    });
    if(response.statusCode == 201) {
      await _storage.write(key: "acessToken", value: response.data['acessToken']);
     acessToken = response.data['acessToken'];
    } else {
      acessToken = null;
      _storage.deleteAll();
    }
  }
}