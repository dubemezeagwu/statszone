import 'package:statszone/domain/app_domain.dart';

class TeamServices extends ApiService {
  Logger logger = Logger();
  static String leagueId = "39";
  static String currentSeason = "2022";

  Future<NetworkResponse<List<TeamInfo>>> getTeamsFromLeague() async {
    final String url = "$baseUrl/teams?season=$currentSeason&league=$leagueId";
    try {
      final Response res = await dio.get(url,
          options: defaultOptions.copyWith(headers: <String, String>{
            "x-rapidapi-key": apiKey,
            "x-rapidapi-host": baseUrl
          }));
      switch (res.statusCode) {
        case SERVER_OKAY:
          try {
            List<TeamInfo> list = [];
            res.data["response"].forEach((a) {
              list.add(TeamInfo.fromJson(a));
            });
            return NetworkResponse(
                message: "Successful", status: true, data: list);
          } catch (e) {
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
    } on DioError catch (e) {
      logger.e(e.toString());
      return NetworkResponse.handleException(e);
    } catch (e) {
      logger.e(e.toString());
      throw e.toString();
    }
  }
}
