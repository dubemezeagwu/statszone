import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:statszone/domain/app_domain.dart';
import 'package:statszone/presentation/widgets/charts/custom_spider_chart.dart';

class PlayerDetailedScreen extends ConsumerWidget {
  const PlayerDetailedScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final player = ref.watch(selectedPlayerProvider);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Center(
                child: ClipOval(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: CachedNetworkImage(
                    imageUrl: player!.player!.image!,
                  ),
                ),
              ),
              title: Text(player!.player!.name!),
            ),
          ),
          SliverToBoxAdapter(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
              divider,
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
                      subTitle:
                          player.player!.dateOfBirth!.date?.formatDate ?? '',
                    ),
                    customInfo(
                        title: "HEIGHT",
                        subTitle: player.player!.height ?? 'NIL')
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    customInfo(
                      title: "WEIGHT",
                      subTitle: player.player!.weight ?? 'NIL',
                    ),
                    customInfo(
                        title: "POSITION",
                        subTitle: player.playerStats!.game!.position),
                    customInfo(
                        title: "AGE",
                        subTitle: "${player!.player!.age.toString()} yrs")
                  ],
                ),
              ),
              divider,
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Text(
                  "Attribute Overview",
                  style: context.textTheme.bodyLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 48.h,
              ),
              CustomSpiderChart(
                playerAttributes: generateRandomNumbers(),
              ),
              SizedBox(
                height: 16.h,
              ),
              divider,
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                ),
                child: Text(
                  "Player Statistics",
                  style: context.textTheme.bodyLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  playerStatistics(
                      title: SvgPicture.asset(
                        AppAssets.soccerBall,
                        width: 25,
                        height: 25,
                      ),
                      subTitle:
                          player.playerStats!.goal?.total.toString() ?? '0'),
                  playerStatistics(
                      title: SvgPicture.asset(
                        AppAssets.soccerShoe,
                        width: 25,
                        height: 25,
                      ),
                      subTitle:
                          player.playerStats!.goal?.assists.toString() ?? '0'),
                  playerStatistics(
                      title: yellowCard,
                      subTitle:
                          player.playerStats!.card?.yellow.toString() ?? '0'),
                  playerStatistics(
                      title: redCard,
                      subTitle:
                          player.playerStats!.card?.red.toString() ?? '0'),
                ],
              ),
              SizedBox(
                height: 32.h,
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

  Widget playerStatistics({required Widget title, required String subTitle}) {
    return Column(
      children: [
        title,
        SizedBox(
          height: 2.h,
        ),
        Text(subTitle),
      ],
    );
  }

  List<double> generateRandomNumbers() {
    final random = Random();
    return List.generate(5, (index) => (30 + random.nextDouble() * 70));
  }
}
