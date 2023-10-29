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
              "AR","BE","CA","BR","EN","GB","FR","DE","NG","IT","HR","GH","NL","PT","ES","US","TR"
            ];
            res.data["response"].forEach((a) {
              list.add(Country.fromJson(a));
              list = list.where((element) => countryCodes.any((code) => code == element.code)).toList();
              list.removeWhere(
                      (element) => element.name == "Scotland"
                          || element.name == "Northern-Ireland"
                          || element.name == "Wales"
              );
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

  // Get all leagues for a particular country.
  Future<NetworkResponse<List<League>>> getLeaguesForCountries
      (String countryCode) async {
    final String url = "$baseUrl/leagues?code=$countryCode";
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
      switch (res.statusCode) {
        case SERVER_OKAY:
          try {
            List<League> list = [];
            res.data["response"].forEach((a) {
              list.add(League.fromJson(a["league"]));
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