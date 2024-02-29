import 'package:cached_network_image/cached_network_image.dart';
import 'package:statszone/presentation/app_presentation.dart';

class PlayerSquadWidget extends StatelessWidget {
  final String? playerImage;
  final String name;
  final String? playerNumber;
  final String? position;

  const PlayerSquadWidget(
      {super.key,
      this.playerImage,
      required this.name,
      this.playerNumber,
      this.position});

  @override
  Widget build(BuildContext context) {
    return ShadowCard(
      contentPadding: 0,
      child: ListTile(
        visualDensity: const VisualDensity(horizontal: 0, vertical: -2),
        leading: SizedBox(
            height: 35,
            width: 35,
            child: CachedNetworkImage(
              imageUrl: playerImage ?? "",
              errorWidget: (context, url, error) => const Icon(Icons.error),
            )),
        title: Text(
          name ?? "name",
          style: context.theme.textTheme.bodyLarge?.copyWith(color: kBlack),
        ),
        subtitle: Row(
          children: [
            Text(
              playerNumber ?? "00",
              style: context.theme.textTheme.bodyLarge?.copyWith(color: kBlack),
            ),
            const SizedBox(
              width: 4,
            ),
            Container(
              width: 5,
              height: 5,
              decoration:
                  const BoxDecoration(shape: BoxShape.circle, color: kGrey),
            ),
            const SizedBox(
              width: 4,
            ),
            Text(position ?? "Footballer"),
          ],
        ),
      ),
    );
  }
}
