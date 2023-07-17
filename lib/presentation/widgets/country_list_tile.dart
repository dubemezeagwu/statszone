import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CountryListTile extends StatelessWidget {
  final String title;
  final String? image;

  const CountryListTile({
    Key? key,
    required this.title,
    this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
          height: 25,
          width: 25,
          child: SvgPicture.network(image!)),
      title: Text(title),
      trailing: const Icon(Icons.arrow_drop_down_outlined),
    );
  }
}
