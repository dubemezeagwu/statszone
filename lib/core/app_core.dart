import 'package:dio/dio.dart';

class ApiService {
  static const _baseUrl = "https://api-football-v1.p.rapidapi.com/v3/";
  static const _timeoutTwo = Duration(minutes: 2);
  static const _timeoutThree = Duration(minutes: 3);

  final Dio dio = Dio(BaseOptions(
    baseUrl: _baseUrl,
    sendTimeout: _timeoutThree,
    receiveTimeout: _timeoutThree,
    contentType: "application/json",
    validateStatus: (int? s) => s! < 500
  ));

  Options defaultOptions = Options(
      sendTimeout: _timeoutTwo, // 20 seconds
      receiveTimeout: _timeoutTwo, // 20 seconds
      contentType: 'application/json',
      validateStatus: (int? s) => s! < 500);
}