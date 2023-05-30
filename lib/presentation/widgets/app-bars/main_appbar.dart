import 'package:statszone/presentation/app_presentation.dart';


class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool automaticallyImplyLeading;
  PreferredSizeWidget? bottom;

  MainAppBar({
    Key? key,
    required this.title,
    required this.automaticallyImplyLeading}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(52);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: bottom,
      automaticallyImplyLeading: automaticallyImplyLeading,
      centerTitle: true,
      title: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 28, maxWidth: 300),
        child: Text(
            title,
            style: AppStyle.preTitle.copyWith(fontSize: 16, fontWeight: FontWeight.w600)
        ),
      ),
    );
  }


}
