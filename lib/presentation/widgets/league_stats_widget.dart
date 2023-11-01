import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:statszone/domain/app_domain.dart';

class LeagueStatsTopWidget extends StatelessWidget {
  final String name;
  final String teamName;
  final String teamLogo;
  final String value;
  final String playerPhoto;
  const LeagueStatsTopWidget(
      {super.key,
      required this.name,
      required this.teamName,
      required this.teamLogo,
      required this.value,
      required this.playerPhoto});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(20),
        height: 200.h,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: kBackground,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("1"),
                  Text(
                    name,
                    style: context.textTheme.bodyLarge,
                  ),
                  Row(
                    children: [
                      CachedNetworkImage(
                        imageUrl: teamLogo ?? "",
                        width: 25.w,
                        height: 25.h,
                      ),
                      SizedBox(width: 5.w,),
                      Text(teamName),
                    ],
                  ),
                  Text(
                    "39",
                    style: context.textTheme.displayLarge,
                  )
                ],
              ),
            ),
            CachedNetworkImage(
              imageUrl:
                  playerPhoto,
              width: 200.w,
              height: 200.h,
            ),
          ],
        ));
  }
}
