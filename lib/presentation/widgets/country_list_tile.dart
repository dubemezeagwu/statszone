import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class TeamListTile extends StatelessWidget {
  final String title;
  final String? image;

  const TeamListTile({Key? key, required this.title, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
          height: 35,
          width: 35,
          child: CachedNetworkImage(
            imageUrl: image!,
            errorWidget: (context, url, error) => const Icon(Icons.error),
          )),
      title: Text(title),
      // trailing: const Icon(Icons.arrow_drop_down_outlined),
    );
  }
}
