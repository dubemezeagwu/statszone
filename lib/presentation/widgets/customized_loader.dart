import 'package:statszone/core/app_core.dart';

class CustomizedLoader extends StatefulWidget {
  const CustomizedLoader({super.key});

  @override
  State<CustomizedLoader> createState() => _CustomizedLoaderState();
}

class _CustomizedLoaderState extends State<CustomizedLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 2000),
        value: 0.25,
        lowerBound: 0.25,
        upperBound: 0.5);

    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);
    _controller.fling();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _animation,
      child: SizedBox(
        height: 50,
        width: 50,
        child: SvgPicture.asset(
          AppAssets.soccerBall),)
      );
  }
}
