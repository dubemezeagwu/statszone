import 'package:statszone/presentation/app_presentation.dart';
import 'package:statszone/presentation/widgets/text-fields/app_textfield.dart';

class PlayersScreen extends StatelessWidget {
  const PlayersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        const AppTextField(
          prefixIcon: Icon(
            Icons.search_outlined,
            size: 25,
          ),
          isSearch: true,
          hintText: "Search Players",
        ).paddingAll(20.0),
        const SizedBox(
          height: 12,
        ),
      ],
    ));
  }
}
