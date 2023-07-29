import 'package:statszone/domain/app_domain.dart';
import 'package:statszone/domain/view_models/country_view_model.dart';
import 'package:statszone/presentation/app_presentation.dart';
import 'package:statszone/presentation/widgets/country_expansion_widget.dart';
import 'package:statszone/presentation/widgets/country_list_tile.dart';

final countryFutureProvider = FutureProvider.family(
    (ref, WidgetRef _ref) async =>
        ref.watch(countryViewModelProvider).getAllCountries()
);

final leaguesFutureProvider = FutureProvider.family<List<League>, String>(
        (ref, String countryCode) async =>
        ref.watch(countryViewModelProvider).getLeaguesForCountry()
);


class LeaguesScreen extends ConsumerWidget {
  const LeaguesScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final countryData = ref.watch(countryFutureProvider(ref));
    final listOfCountries = countryData.value;
    return Container(
      child: countryData.when(
          data: (data) => CountryExpansionWidget(
            countryData: data,),
          error: (e, _) => const Center(child: Text("No Data Found"),),
          loading: () => const Center(child: CircularProgressIndicator(),)),
    );
  }

}
