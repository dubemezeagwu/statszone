import 'package:logger/logger.dart';
import 'package:statszone/domain/app_domain.dart';
import 'package:statszone/domain/models/squad_info.dart';

class PlayerServices extends ApiService {
  Logger logger = Logger();
  static const String leagueId = "39";
  static const String currentSeason = "2022";

  Future<NetworkResponse<List<PlayerInfo>>> searchForPlayer(
      String playerName) async {
    final String url =
        "$baseUrl/players?season=$currentSeason&search=$playerName&league=$leagueId";
    logger.i('Making request to $baseUrl');
    try {
      final Response res = await dio.get(url,
          options: defaultOptions.copyWith(headers: <String, String>{
            "x-rapidapi-key": apiKey,
            "x-rapidapi-host": baseUrl
          }));
      logger.d(res.data);
      switch (res.statusCode) {
        case SERVER_OKAY:
          try {
            List<PlayerInfo> list = [];
            res.data["response"].forEach((a) {
              list.add(PlayerInfo.fromJson(a));
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

  Future<NetworkResponse<List<PlayerInfo>>> getTopGoalScorers() async {
    final String url =
        "$baseUrl/players/topscorers?season=$currentSeason&league=$leagueId";
    try {
      final Response res = await dio.get(url,
          options: defaultOptions.copyWith(headers: <String, String>{
            "x-rapidapi-key": apiKey,
            "x-rapidapi-host": baseUrl
          }));
      switch (res.statusCode) {
        case SERVER_OKAY:
          try {
            List<PlayerInfo> list = [];
            res.data["response"].forEach((a) {
              list.add(PlayerInfo.fromJson(a));
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

  Future<NetworkResponse<List<PlayerInfo>>> getTopAssists() async {
    final String url =
        "$baseUrl/players/topassists?season=$currentSeason&league=$leagueId";
    try {
      final Response res = await dio.get(url,
          options: defaultOptions.copyWith(headers: <String, String>{
            "x-rapidapi-key": apiKey,
            "x-rapidapi-host": baseUrl
          }));
      switch (res.statusCode) {
        case SERVER_OKAY:
          try {
            List<PlayerInfo> list = [];
            res.data["response"].forEach((a) {
              list.add(PlayerInfo.fromJson(a));
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

  Future<NetworkResponse<List<PlayerInfo>>> getTopYellowCards() async {
    final String url =
        "$baseUrl/players/topyellowcards?season=$currentSeason&league=$leagueId";
    try {
      final Response res = await dio.get(url,
          options: defaultOptions.copyWith(headers: <String, String>{
            "x-rapidapi-key": apiKey,
            "x-rapidapi-host": baseUrl
          }));
      switch (res.statusCode) {
        case SERVER_OKAY:
          try {
            List<PlayerInfo> list = [];
            res.data["response"].forEach((a) {
              list.add(PlayerInfo.fromJson(a));
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

  Future<NetworkResponse<List<PlayerInfo>>> getTopRedCards() async {
    final String url =
        "$baseUrl/players/topredcards?season=$currentSeason&league=$leagueId";
    try {
      final Response res = await dio.get(url,
          options: defaultOptions.copyWith(headers: <String, String>{
            "x-rapidapi-key": apiKey,
            "x-rapidapi-host": baseUrl
          }));
      switch (res.statusCode) {
        case SERVER_OKAY:
          try {
            List<PlayerInfo> list = [];
            res.data["response"].forEach((a) {
              list.add(PlayerInfo.fromJson(a));
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

  Future<NetworkResponse<SquadInfo>> getSquadFromTeam(
      {required String teamId}) async {
    final String url = "$baseUrl/players/squads?team=$teamId";
    logger.i('Making request to $baseUrl');
    try {
      final Response res = await dio.get(url,
          options: defaultOptions.copyWith(headers: <String, String>{
            "x-rapidapi-key": apiKey,
            "x-rapidapi-host": baseUrl
          }));
      switch (res.statusCode) {
        case SERVER_OKAY:
          try {
            var data;
            res.data["response"].forEach((a) {
              data = SquadInfo.fromJson(a);
            });

            return NetworkResponse(
                message: "Successful", status: true, data: data);
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
