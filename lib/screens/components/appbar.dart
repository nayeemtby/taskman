import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  final double height;
  final MainAxisAlignment mainAxisAlignment;
  final List<Widget> children;
  final double padding;
  const MyAppBar(
      {Key? key,
      this.height = 56,
      required this.mainAxisAlignment,
      required this.children,
      this.padding = 16})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: padding),
      height: height,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        children: children,
      ),
    );
  }
}
