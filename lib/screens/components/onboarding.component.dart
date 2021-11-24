import 'dart:async';

import 'package:flutter/material.dart';
import 'package:taskman/screens/theme/textheme.dart';
import '../theme/colortheme.dart' as swatch;

class RRectanglePlaceHolder extends StatelessWidget {
  final Size size;
  const RRectanglePlaceHolder({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: (3.1416 / 180) * (30 * (size.height / size.width) * (375 / 764)),
      child: Container(
        height: (size.height / 764) * 395,
        width: (size.width / 375) * 480,
        decoration: BoxDecoration(
            color: const Color(0xff8E8E93),
            borderRadius: BorderRadius.circular(40)),
      ),
    );
  }
}

/// TextCaroussel
class TextCaroussel extends StatefulWidget {
  const TextCaroussel({Key? key}) : super(key: key);

  @override
  _TextCarousselState createState() => _TextCarousselState();
}

class _TextCarousselState extends State<TextCaroussel>
    with TickerProviderStateMixin {
  late TabController tb;
  Timer? timer;
  final List<Map<int, dynamic>> _indi = [
    {1: 48, 2: swatch.PrimaryColors.blue},
    {1: 24, 2: swatch.SecondaryColors.mediumGray},
    {1: 24, 2: swatch.SecondaryColors.mediumGray}
  ];

  @override
  void initState() {
    super.initState();
    tb = TabController(length: 3, vsync: this);
    tb.addListener(_tbListener);
    timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      tb.animateTo((tb.index + 1) % 3);
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer!.cancel();
    tb.removeListener(_tbListener);
    tb.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: TabBarView(controller: tb, children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Center(
                child: Text(
                  "Update Progress Your Work For The Team",
                  style: TxtTheme.largeBold
                      .copyWith(color: swatch.FillColors.primary),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Center(
                // width: double.infinity,
                child: Text(
                  "Create a Task and Assign it to Your Team Members",
                  style: TxtTheme.largeBold
                      .copyWith(color: swatch.FillColors.primary),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Center(
                // width: double.infinity,
                child: Text(
                  "Get Notified When You Get a New Assignment",
                  style: TxtTheme.largeBold
                      .copyWith(color: swatch.FillColors.primary),
                ),
              ),
            ),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 36),
          child: Row(
            children: [
              AnimatedContainer(
                curve: Curves.easeInOutCubic,
                duration: const Duration(milliseconds: 300),
                width: _indi[0][1],
                height: 8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: _indi[0][2],
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              AnimatedContainer(
                curve: Curves.easeInOutCubic,
                duration: const Duration(milliseconds: 150),
                width: _indi[1][1],
                height: 8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: _indi[1][2],
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              AnimatedContainer(
                curve: Curves.easeInOutCubic,
                duration: const Duration(milliseconds: 300),
                width: _indi[2][1],
                height: 8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: _indi[2][2],
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  /// Custom Functions
  _tbListener() {
    if (tb.indexIsChanging) {
      setState(() {
        _indi[tb.previousIndex][1] = 24;
        _indi[tb.index][1] = 48;

        _indi[tb.previousIndex][2] = swatch.SecondaryColors.mediumGray;
        _indi[tb.index][2] = swatch.PrimaryColors.blue;
      });
    }
  }
}
