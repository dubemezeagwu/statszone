import '../app_domain.dart';

class ApiService {

  String baseUrl = GlobalConfigs().get("base_url");
  String apiKey = GlobalConfigs().get("api_key");
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