import 'package:get_it/get_it.dart';
import 'package:statszone/domain/app_domain.dart';

GetIt locator = GetIt.instance;

void initializeLocator() {
  locator.registerLazySingleton(() => CountryServices());
  locator.registerLazySingleton(() => TeamServices());
  locator.registerLazySingleton(() => PlayerServices());
}