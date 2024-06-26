import 'package:logger/logger.dart';
import 'package:statszone/domain/app_domain.dart';

final countryViewModelProvider =
    Provider((ref) => CountryViewModel(ref.watch(countryRepositoryProvider)));

class CountryViewModel {
  final CountryServices _countryServices;
  List<Country> allCountries = [];
  List<League> allLeagues = [];
  String errorMessage = "";
  final logger = Logger();

  CountryViewModel(this._countryServices);

  Future<List<Country>> getAllCountries() async {
    try {
      final response = await _countryServices.getAllCountries();
      if (response.status == true) {
        allCountries = response.data ?? [];
      } else {
        errorMessage = response.message;
      }
    } catch (e) {
      errorMessage = e.toString();
    }
    return allCountries;
  }

  Future<List<League>> getLeaguesForCountry() async {
    List<League> currentLeagues = [];
    try {
      for (var country in allCountries) {
        final response =
            await _countryServices.getLeaguesForCountries(country.code!);
        if (response.status == true) {
          currentLeagues = response.data ?? [];
          return currentLeagues;
        } else {
          errorMessage = response.message;
        }
      }
    } catch (e) {
      errorMessage = e.toString();
    }
    return currentLeagues;
  }
}
