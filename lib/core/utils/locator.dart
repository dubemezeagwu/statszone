import 'package:get_it/get_it.dart';
import 'package:statszone/domain/repository/country_services.dart';
import 'package:statszone/domain/view_models/country_view_model.dart';

GetIt locator = GetIt.instance;

void initializeLocator (){
  locator.registerLazySingleton(() => CountryServices());
}