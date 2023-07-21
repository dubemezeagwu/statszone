import 'package:logger/logger.dart';
import 'package:statszone/domain/app_domain.dart';


class CountryServices extends ApiService {
  Logger logger = Logger();

  // Get all the specified countries according to their country codes.
  Future<NetworkResponse<List<Country>>> getAllCountries () async {
    final String url = "$baseUrl/countries";
    logger.i('Making request to $baseUrl');
    try {
      final Response res = await dio.get(
        url,
        options: defaultOptions.copyWith(
            headers: <String, String>{
              "x-rapidapi-key" : apiKey,
              "x-rapidapi-host": baseUrl
            })
      );
      logger.d(res.data);
      switch (res.statusCode) {
        case SERVER_OKAY:
          try {
            List<Country> list = [];
            List<String> countryCodes = [
              "BE","CA","BR","GB","FR","DE","NG","IT","NL","PT","ES","US","TR"
            ];
            res.data["response"].forEach((a) {
              list.add(Country.fromJson(a));
              list = list.where((element) => countryCodes.any((code) => code == element.code)).toList();
            });
            return NetworkResponse(
                message: "Successful",
                status: true,
                data: list);
          } catch (e){
            throw PARSING_ERROR;
          }
        case NO_CONTENT:
          throw res.data["message"].toString();
        case TIME_OUT:
          throw res.data["message"].toString();
        case INTERNAL_SERVER_ERROR:
          throw res.data["message"].toString();
        default:
          throw res.data['message'].first ?? 'Unknown Error';
      }
    } on DioError catch (e){
      logger.e(e.toString());
      return NetworkResponse.handleException(e);

    }
    catch (e){
      logger.e(e.toString());
      throw e.toString();
    }
  }


  Future<NetworkResponse<List<Country>>> getLeaguesForCountries () async {
    final String url = "$baseUrl/countries";
    logger.i('Making request to $baseUrl');
    try {
      final Response res = await dio.get(
          url,
          options: defaultOptions.copyWith(
              headers: <String, String>{
                "x-rapidapi-key" : apiKey,
                "x-rapidapi-host": baseUrl
              })
      );
      logger.d(res.data);
      switch (res.statusCode) {
        case SERVER_OKAY:
          try {
            List<Country> list = [];
            List<String> countryCodes = [
              "BE","CA","BR","GB","FR","DE","NG","IT","NL","PT","ES","US","TR","ZA",
            ];
            res.data["response"].forEach((a) {
              list.add(Country.fromJson(a));
              list = list.where((element) => countryCodes.any((code) => code == element.code)).toList();
            });
            return NetworkResponse(
                message: "Successful",
                status: true,
                data: list);
          } catch (e){
            throw PARSING_ERROR;
          }
        case NO_CONTENT:
          throw res.data["message"].toString();
        case TIME_OUT:
          throw res.data["message"].toString();
        case INTERNAL_SERVER_ERROR:
          throw res.data["message"].toString();
        default:
          throw res.data['message'].first ?? 'Unknown Error';
      }
    } on DioError catch (e){
      logger.e(e.toString());
      return NetworkResponse.handleException(e);

    }
    catch (e){
      logger.e(e.toString());
      throw e.toString();
    }
  }
}