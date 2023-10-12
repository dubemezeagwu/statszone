import 'package:cached_network_image/cached_network_image.dart';
import 'package:statszone/presentation/app_presentation.dart';

class StatsPreviewWidget extends StatelessWidget {
  final String? image;
  final String? statsTitle;
  final String? statsNumber;

  const StatsPreviewWidget({
    super.key, 
    required this.image, 
    required this.statsTitle, 
    required this.statsNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      margin: EdgeInsets.only(top: 50),
      decoration: BoxDecoration(
          color: kBlueGrey,
          border: Border.all(
            color: kGrey,
            width: 0.7,
          ),
          boxShadow: const [
            BoxShadow(
              color: kGrey500,
              offset: Offset(0, 2),
              blurRadius: 4,
              spreadRadius: 0.25,
            ),
          ],
          borderRadius: BorderRadius.circular(6)),
      child: Column(
        children: [
          SizedBox(
            width: 150,
            child: CachedNetworkImage(
              colorBlendMode: BlendMode.color,
              fit: BoxFit.contain,
              imageUrl: image!,
            ),
          ),
          SizedBox(height: 12),
          Text(statsTitle!),
          SizedBox(height: 6),
          Text(
            statsNumber ?? "0",
            style: AppStyle.header2.copyWith(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}