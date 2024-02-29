import 'package:go_router/go_router.dart';
import 'package:statszone/presentation/app_presentation.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
          onTap: () {
            context.goNamed("favouritesInfo");
          },
          child: Text("Favorites")),
    );
  }
}
