import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PlayerDetailedScreen extends StatelessWidget {
  const PlayerDetailedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 350,
            flexibleSpace: FlexibleSpaceBar(
              background: CachedNetworkImage(
                height: 300,
                width: 400,
                imageUrl: "https://media-2.api-sports.io/football/players/1100.png",
                ),
                title: Text("Erling Haaland"),
                ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: ClipRect(
                  child: Container(
                    height: 400,
                    color: Colors.amber,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: ClipRect(
                  child: Container(
                    height: 400,
                    color: Colors.amber,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: ClipRect(
                  child: Container(
                    height: 400,
                    color: Colors.amber,
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}