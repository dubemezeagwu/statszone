import 'package:logger/logger.dart';
import 'package:statszone/domain/app_domain.dart';


class CountryServices extends ApiService {
  Logger logger = Logger();

  Future<NetworkResponse<List<Country>>> getAllCountries () async {
    final String url = "$baseUrl/countries";
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
            res.data["response"].forEach((a) {
              list.add(Country.fromJson(a));
            });
            return NetworkResponse(
                message: "Successful",
                status: true,
                data: list);
          } catch (e){
            throw PARSING_ERROR;
          }
          break;
        case NO_CONTENT:
          throw res.data["message"].toString();
          break;
        case TIME_OUT:
          throw res.data["message"].toString();
          break;
        case INTERNAL_SERVER_ERROR:
          throw res.data["message"].toString();
          break;
        default:
          throw res.data['message'].first ?? 'Unknown Error';
      }
    } on DioError catch (e){
      return NetworkResponse.handleException(e);
    }
    catch (e){
      throw e.toString();
    }
  }
}