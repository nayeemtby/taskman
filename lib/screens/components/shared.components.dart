import 'package:flutter/material.dart';
import '../theme/textheme.dart';
import '../theme/colortheme.dart' as swatch;

class _TagUrgent extends StatelessWidget {
  const _TagUrgent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: swatch.SecondaryColors.lightpink,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Text(
        "Urgent",
        style: TxtTheme.caption1.copyWith(color: swatch.PrimaryColors.pink),
      ),
    );
  }
}

class _TagInProgress extends StatelessWidget {
  const _TagInProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: swatch.SecondaryColors.lightblue,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Text(
        "In Progress",
        style: TxtTheme.caption1.copyWith(color: swatch.PrimaryColors.blue),
      ),
    );
  }
}

class _TagReview extends StatelessWidget {
  const _TagReview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: swatch.SecondaryColors.lightyellow,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Text(
        "In Review",
        style: TxtTheme.caption1.copyWith(color: swatch.PrimaryColors.yellow),
      ),
    );
  }
}

class _TagApprove extends StatelessWidget {
  const _TagApprove({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: swatch.SecondaryColors.lighttosca,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Text(
        "Approve",
        style: TxtTheme.caption1.copyWith(color: swatch.PrimaryColors.tosca),
      ),
    );
  }
}

class TaskTag {
  static const Widget urgent = _TagUrgent();
  static const Widget inProgress = _TagInProgress();
  static const Widget inReview = _TagReview();
  static const Widget approve = _TagApprove();
}
