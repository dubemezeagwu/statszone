import 'package:cached_network_image/cached_network_image.dart';
import 'package:statszone/domain/app_domain.dart';
import 'package:statszone/presentation/app_presentation.dart';

class PlayerDetailedScreen extends ConsumerWidget {
  const PlayerDetailedScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final player = ref.read(selectedPlayerProvider);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Center(
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl:
                        player!.player!.image!,
                  ),
                ),
              ),
              title: Text(player!.player!.name!),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CachedNetworkImage(
                      imageUrl: player.playerStats!.team?.logo ?? '',
                      width: 50.w,
                      height: 50.h,
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Text(
                        player.playerStats!.team?.name ?? '',
                      style: context.textTheme.bodyLarge,
                    )
                  ],
                ),
              ),
              const Divider(
                thickness: 2,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    customInfo(
                      title: "NATIONALITY",
                      subTitle: player.player?.nationality ?? '',
                    ),
                    customInfo(
                      title: "DATE OF BIRTH",
                      subTitle: player.player!.dateOfBirth!.date?.formatDate ?? '',
                    ),
                    customInfo(title: "HEIGHT", subTitle: player.player!.height ?? 'NIL')
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    customInfo(title: "WEIGHT", subTitle: player.player!.weight ?? 'NIL',),
                    customInfo(title: "POSITION", subTitle: player.playerStats!.game!.position),
                    customInfo(title: "AGE", subTitle: "${player!.player!.age.toString()} yrs")
                  ],
                ),
              ),
              Divider(
                thickness: 2,
              ),
            ]),
          )
        ],
      ),
    );
  }

  Widget customInfo({required String title, required String subTitle}) {
    return Column(
      children: [
        Text(
          title,
          style: AppStyle.body.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 2.h,
        ),
        Text(subTitle),
      ],
    );
  }
}
