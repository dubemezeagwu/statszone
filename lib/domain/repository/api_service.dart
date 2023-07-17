import '../app_domain.dart';

class ApiService {

  String baseUrl = "https://v3.football.api-sports.io";
  String apiKey = "7023d9d786704622f2483912f186a10b";
  static const _timeoutTwo = Duration(minutes: 2);
  static const _timeoutThree = Duration(minutes: 3);

  final Dio dio = Dio(BaseOptions(
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