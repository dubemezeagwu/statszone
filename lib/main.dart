import 'package:global_configs/global_configs.dart';
import 'package:provider/provider.dart';
import 'package:statszone/core/utils/theme_notifier.dart';
import 'package:statszone/presentation/app_presentation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GlobalConfigs().get("assets/cfg/config.json");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: appProviders,
      child: Consumer<ThemeNotifier>(
        builder: (context, themeNotifier, child){
          return MaterialApp(
              title: 'Stats Zone',
              theme: themeNotifier.darkTheme
                  ? AppTheme.darkTheme()
                  : AppTheme.lightTheme(),
              debugShowCheckedModeBanner: false,
              home: NavigationWidget()
          );
        },
      ),
    );
  }
}

var appProviders = [
  ChangeNotifierProvider(create: (_) => ThemeNotifier())
];

