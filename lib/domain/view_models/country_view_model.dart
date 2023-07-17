import 'package:statszone/domain/app_domain.dart';
import 'package:statszone/domain/repository/country_services.dart';

// class CountryViewModel extends BaseViewModel{
//   final CountryServices _countryServices = locator<CountryServices>();
//   List<Country> allCountries = [];
//
//   @override
//   String errorMessage = "";
//
//
//   Future <List<Country>>getAllCountries () async{
//     setAppState(AppState.Busy);
//     try{
//       final response = await _countryServices.getAllCountries();
//       if (response.status == true ){
//         allCountries = response.data!;
//       } else {
//         errorMessage = response.message;
//       }
//       setAppState(AppState.Idle);
//     }catch(e){
//       errorMessage = e.toString();
//       setAppState(AppState.Idle);
//     }
//     return allCountries;
//   }
// }

final countryViewModelProvider = Provider((ref) => CountryViewModel());

class CountryViewModel {
  final CountryServices _countryServices = locator<CountryServices>();
  List<Country> allCountries = [];
  String errorMessage = "";

  Future<List<Country>> getAllCountries () async {
    try {
      final response = await _countryServices.getAllCountries();
      if (response.status == true) {
        allCountries = response.data ?? [];
      } else {
        errorMessage = response.message;
      }
    } catch (e){
      errorMessage = e.toString();
    }
    return allCountries;
  }
}