import 'package:dio/dio.dart';

class NetworkResponse <T> {
  final String message;
  final bool status ;
  final T? data;

  NetworkResponse({
      required this.message,
      this.data,
    required this.status
  });

  factory NetworkResponse.fromJson (Map<String, dynamic> json){
    return NetworkResponse(
        message: json["message"] ?? "Data fetched successfully!",
      status: false,
    );
  }

  static NetworkResponse <T> handleException <T> (DioError error){
    if (error.response != null && error.type == DioErrorType.badResponse) {
      return NetworkResponse.fromJson(error.response?.data);
    }
    return NetworkResponse(message: _mapException(error.type), status: false);
  }

  static String _mapException(DioErrorType? error) {
    String errorDescription = "";
    switch (error) {
      case DioErrorType.cancel:
        errorDescription = "Request to Server was canceled";
        break;
      case DioErrorType.connectionTimeout:
        errorDescription = "Connection timeout with the Server";
        break;
      case DioErrorType.sendTimeout:
        errorDescription = "Send timeout with the Server";
        break;
      case DioErrorType.receiveTimeout:
        errorDescription = "Receive timeout with the Server";
        break;
      case DioErrorType.unknown:
        errorDescription = "Please check your Internet connection";
        break;
      case DioErrorType.connectionError:
        errorDescription = "Connect Socket Exception";
        break;
      default:
        "An Error has occurred";
    }
    return errorDescription;
  }
}