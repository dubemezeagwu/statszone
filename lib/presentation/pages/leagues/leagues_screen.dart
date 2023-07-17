import 'package:logger/logger.dart';
import 'package:statszone/core/utils/theme_notifier.dart';
import 'package:statszone/domain/app_domain.dart';
import 'package:statszone/domain/view_models/country_view_model.dart';
import 'package:statszone/presentation/app_presentation.dart';
import 'package:statszone/presentation/widgets/country_list_tile.dart';

final countryFutureProvider = FutureProvider.family(
    (ref, WidgetRef _ref) async =>
        ref.watch(countryViewModelProvider).getAllCountries()
);


class LeaguesScreen extends ConsumerWidget {
  const LeaguesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final countryData = ref.watch(countryFutureProvider(ref));
    return Container(
      child: countryData.when(
          data: (data) => ListView.builder(
            padding: const EdgeInsets.only(top: 16,bottom: 16),
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return CountryListTile(
                  title: data[index].name!,
                  image: data[index].flag,
              );
            },),
          error: (e, _) => const Center(child: Text("No Data Found"),),
          loading: () => const Center(child: CircularProgressIndicator(),)),
    );
  }
}
