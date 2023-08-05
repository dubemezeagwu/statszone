import 'package:statszone/domain/app_domain.dart';
import 'package:statszone/domain/view_models/team_view_model.dart';
import 'package:statszone/presentation/widgets/country_expansion_widget.dart';
import 'package:statszone/presentation/widgets/customized_loader.dart';

final countryFutureProvider = FutureProvider.family(
    (ref, WidgetRef _ref) async =>
        ref.watch(countryViewModelProvider).getAllCountries());

final leaguesFutureProvider = FutureProvider.family<List<League>, String>(
    (ref, String countryCode) async =>
        ref.watch(countryViewModelProvider).getLeaguesForCountry());

final teamsFutureProvider = FutureProvider.family((ref, WidgetRef _ref) async =>
    ref.watch(teamViewModelProvider).getAllTeams());

class TeamsScreen extends ConsumerStatefulWidget {
  const TeamsScreen({super.key});

  @override
  ConsumerState<TeamsScreen> createState() => _TeamsScreenState();
}

class _TeamsScreenState extends ConsumerState<TeamsScreen> {

  
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: ((context, ref, child) {
    final countryData = ref.watch(teamsFutureProvider(ref));
    return Container(
      child: countryData.when(
          data: (data) => CustomExpansionWidget(
                teamData: data,
              ),
          error: (e, _) => const Center(
                child: Text("No Data Found"),
              ),
          loading: () => const Center(
                child: CustomizedLoader(),
              )),
    );
    }));
  }
}
