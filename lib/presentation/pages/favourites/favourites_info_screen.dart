import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:statszone/presentation/app_presentation.dart';
import 'package:statszone/presentation/widgets/app-bars/main_appbar.dart';

class FavouritesInfoScreen extends StatelessWidget {
  const FavouritesInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: "Squad",
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical, child: Center(child: Text("Favourites Info"),)),
    );
  }
}