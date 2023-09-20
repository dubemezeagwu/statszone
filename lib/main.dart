import 'package:global_configs/global_configs.dart';
import 'package:statszone/presentation/app_presentation.dart';
import 'package:statszone/presentation/navigation/navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeLocator();
  await GlobalConfigs().loadJsonFromdir('assets/cfg/config.json');
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool themeStatus = ref.watch(themeNotifierProvider);
    return GestureDetector(
      onTap: () {
        // FocusScopeNode currentFocus = FocusScope.of(context);
        // if (!currentFocus.hasPrimaryFocus) {
        //   currentFocus.unfocus();
        // }
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MaterialApp(
          title: 'Stats Zone',
          theme: themeStatus ? AppTheme.darkTheme() : AppTheme.lightTheme(),
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.navigation,
          onGenerateRoute: AppNavigator.generateRoute,
          ),
    );
  }
}

// var appProviders = [
//   ChangeNotifierProvider<ThemeNotifier>(create: (_) => ThemeNotifier()),
//   ChangeNotifierProvider<CountryViewModel>(create: (_) => CountryViewModel())
// ];

