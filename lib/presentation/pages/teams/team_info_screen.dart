import 'package:flutter/material.dart';
import 'package:statszone/presentation/widgets/app-bars/main_appbar.dart';

class TeamInfoScreen extends StatelessWidget {
  const TeamInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: "Squad",
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical, child: Center(child: Text("Teams"),)),
    );
  }
}