import 'package:global_configs/global_configs.dart';
import 'package:statszone/core/utils/theme_notifier.dart';
import 'package:statszone/domain/repository/country_services.dart';
import 'package:statszone/domain/view_models/country_view_model.dart';
import 'package:statszone/presentation/app_presentation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeLocator();
  // final CountryServices service = CountryServices();
  // await service.getAllCountries();
  await GlobalConfigs().get("assets/cfg/config.json");
  runApp(
    const ProviderScope(
        child: MyApp()
    )
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool themeStatus = ref.watch(themeNotifierProvider);
    return MaterialApp(
        title: 'Stats Zone',
        theme: themeStatus
            ? AppTheme.darkTheme()
            : AppTheme.lightTheme(),
        debugShowCheckedModeBanner: false,
        home: NavigationWidget()
    );
  }
}

// var appProviders = [
//   ChangeNotifierProvider<ThemeNotifier>(create: (_) => ThemeNotifier()),
//   ChangeNotifierProvider<CountryViewModel>(create: (_) => CountryViewModel())
// ];

