import 'package:flutter/material.dart';
import 'package:taskman/screens/components/buttons.dart';
import '../theme/colortheme.dart' as swatch;
import '../theme/textheme.dart';

// ignore: unused_element
Size _getTxtSize(
    {required String txt,
    int maxLines = 1,
    required double factor,
    required TextStyle style}) {
  return (TextPainter(
          maxLines: maxLines,
          text: TextSpan(text: txt, style: style),
          textDirection: TextDirection.ltr,
          textScaleFactor: factor)
        ..layout())
      .size;
}

class TaskItem extends StatelessWidget {
  final Widget tag;
  final String title;
  final int total;
  final int done;
  final String txt;
  const TaskItem(
      {Key? key,
      required this.tag,
      required this.title,
      required this.total,
      required this.done})
      : txt = "$done/$total",
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: swatch.SecondaryColors.mediumGray,
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.check_box_outlined,
                    color: swatch.FillColors.secondary,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    title,
                    style: TxtTheme.calloutRegular
                        .copyWith(color: swatch.LabelColors.quarternary),
                  )
                ],
              ),
              tag
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 32,
                  ),
                  Container(
                    width: 220,
                    height: 8,
                    decoration: BoxDecoration(
                        color: swatch.progressbarBg,
                        borderRadius: BorderRadius.circular(4)),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        height: 8,
                        width: 100,
                        decoration: BoxDecoration(
                            color: swatch.PrimaryColors.purple,
                            borderRadius: BorderRadius.circular(4)),
                      ),
                    ),
                  )
                ],
              ),
              Text(
                "$done/$total",
                style: TxtTheme.footnote
                    .copyWith(color: swatch.FillColors.secondary),
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              const SizedBox(
                width: 32,
              ),
              Container(
                height: 8,
                width: 8,
                decoration: BoxDecoration(
                    color: swatch.PrimaryColors.tosca,
                    borderRadius: BorderRadius.circular(4)),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                "2 Days Left",
                style: TxtTheme.footnote
                    .copyWith(color: swatch.FillColors.secondary),
              )
            ],
          )
        ],
      ),
    );
  }
}

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

class TaskCategory extends StatelessWidget {
  final String name;
  final int count;
  final Color color;
  const TaskCategory(
      {Key? key, required this.name, required this.count, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 57,
      width: 128,
      padding: const EdgeInsets.only(
        top: 12,
        bottom: 12,
      ),
      decoration: BoxDecoration(
          color: swatch.SecondaryColors.mediumGray,
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: double.infinity,
            width: 4,
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(8)),
          ),
          const SizedBox(
            width: 24,
          ),
          Text(
            count.toString(),
            style:
                TxtTheme.titleSmall.copyWith(color: swatch.FillColors.primary),
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            name,
            style:
                TxtTheme.footnote.copyWith(color: swatch.FillColors.secondary),
          )
        ],
      ),
    );
  }
}

class TeamCreatedDialog extends StatelessWidget {
  const TeamCreatedDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: swatch.PrimaryColors.darkGray,
      // insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundColor: swatch.SecondaryColors.mediumGray,
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              "Congratulations!",
              style: TxtTheme.titleLarge
                  .copyWith(color: swatch.LabelColors.quarternary),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "Parto team was created successfully.\nCreate your latest project so you can work with your team.",
              textAlign: TextAlign.center,
              style: TxtTheme.calloutRegular
                  .copyWith(color: swatch.FillColors.secondary),
            ),
            const SizedBox(
              height: 32,
            ),
            BtnPrimary(
                txt: "Next",
                onTap: () {
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }
}
