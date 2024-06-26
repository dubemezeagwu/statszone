import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:statszone/presentation/app_presentation.dart';

class PlayerSearchWidget extends StatelessWidget {
  final String? playerImage;
  final String name;
  final String? teamLogo;
  final String? teamName;
  final String? position;

  const PlayerSearchWidget(
      {super.key,
      required this.playerImage,
      required this.name,
      required this.teamLogo,
      required this.teamName,
      required this.position});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),
      endActionPane: ActionPane(
        extentRatio: 0.85,
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: ((context) {}),
            backgroundColor: kAmber,
            foregroundColor: Colors.white,
            icon: Icons.star,
            label: 'Favourite',
          ),
        ],
      ),
      child: ShadowCard(
        contentPadding: 0,
        child: ListTile(
          visualDensity: const VisualDensity(horizontal: 0, vertical: -2),
          leading: SizedBox(
              height: 35,
              width: 35,
              child: CachedNetworkImage(
                imageUrl: playerImage!,
                errorWidget: (context, url, error) => const Icon(Icons.error),
              )),
          title: Text(
            name,
            style: context.theme.textTheme.bodyLarge?.copyWith(color: kBlack),
          ),
          subtitle: Row(
            children: [
              SizedBox(
                width: 20,
                height: 20,
                child: CachedNetworkImage(
                  imageUrl: teamLogo!,
                  errorWidget: ((context, url, error) =>
                      const Icon(Icons.error)),
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              Text(teamName!),
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
      ),
    );
  }
}
