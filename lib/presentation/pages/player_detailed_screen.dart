import 'package:cached_network_image/cached_network_image.dart';
import 'package:statszone/presentation/app_presentation.dart';

class PlayerDetailedScreen extends StatelessWidget {
  const PlayerDetailedScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                        "https://media-2.api-sports.io/football/players/1100.png",
                  ),
                ),
              ),
              title: Text("Erling Haaland"),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CachedNetworkImage(
                      imageUrl:
                          "https://media-4.api-sports.io/football/teams/50.png",
                      width: 50.w,
                      height: 50.h,
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Text("Manchester City")
                  ],
                )
              ]),
            ),
          )
        ],
      ),
    );
  }
}
