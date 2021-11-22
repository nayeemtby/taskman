import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  final double height;
  final MainAxisAlignment mainAxisAlignment;
  final List<Widget> children;
  final double horizontalPadding;
  final double verticalPadding;
  const MyAppBar(
      {Key? key,
      this.height = 56,
      required this.mainAxisAlignment,
      required this.children,
      this.horizontalPadding = 16,
      this.verticalPadding = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding, vertical: verticalPadding),
      height: height,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        children: children,
      ),
    );
  }
}
