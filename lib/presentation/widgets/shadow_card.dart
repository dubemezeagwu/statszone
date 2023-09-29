import 'package:flutter/material.dart';
import 'package:statszone/core/utils/extensions.dart';

class ShadowCard extends StatefulWidget {
  final Widget child;
  final Border? borderStyle;
  final Color? boxShadowColor;
  final Color? boxMainColor;
  final double? contentPadding;

  const ShadowCard(
      {Key? key,
      required this.child,
      this.boxShadowColor,
      this.borderStyle,
      this.boxMainColor, 
      this.contentPadding = 20.0})
      : super(key: key);

  @override
  _ShadowCardState createState() => _ShadowCardState();
}

class _ShadowCardState extends State<ShadowCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Card(
          elevation: 5,
          margin: const EdgeInsets.all(20.0),
          color: Colors.white,
          child: Container(
            padding: EdgeInsets.all(widget.contentPadding!),
            decoration: BoxDecoration(
                color: context.theme.brightness == Brightness.dark 
                ? context.colorScheme.inversePrimary 
                : context.colorScheme.background,
                border: widget.borderStyle ??
                    Border.all(color: context.colorScheme.primary, width: 2),
                boxShadow: [
                  BoxShadow(
                      color: widget.boxShadowColor ?? context.colorScheme.primary,
                      offset: const Offset(10.0, 10.0))
                ]),
            child: widget.child,
          ),
        )
      ],
    );
  }
}
