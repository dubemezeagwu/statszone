import 'package:statszone/domain/app_domain.dart';


final teamRepositoryProvider = Provider((ref) => TeamServices());
final countryRepositoryProvider = Provider((ref) => CountryServices());
final playerRepositoryProvider = Provider((ref) => PlayerServices());
