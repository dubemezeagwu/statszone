import 'package:statszone/presentation/app_presentation.dart';
import 'package:statszone/presentation/widgets/text-fields/app_textfield.dart';

class CompareScreen extends StatelessWidget {
  const CompareScreen({Key? key}) : super(key: key);

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
            fillColor: Colors.white,
            isSearch: true,
            hintText: "Search Players",
          ).paddingAll(20.0),
          const SizedBox(height: 12,),
          
        ],
      )
      );
  }
}
