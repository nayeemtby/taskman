import 'package:flutter/material.dart';
import 'theme/colortheme.dart' as swatch;
import 'theme/textheme.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        width: double.infinity,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.calendar_today_outlined,
                      color: swatch.FillColors.secondary,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "March, 04",
                      style: TxtTheme.titleSmall
                          .copyWith(color: swatch.LabelColors.quarternary),
                    )
                  ],
                ),
                Text(
                  "8 Tasks Today",
                  style: TxtTheme.calloutRegular
                      .copyWith(color: swatch.FillColors.secondary),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            // Expanded(
            //   child: ListView.separated(
            //     itemCount: 6,
            //     scrollDirection: Axis.horizontal,
            //     separatorBuilder: (ctx, index) => const SizedBox(
            //       width: 8,
            //     ),
            //     itemBuilder: (ctx, index) => _DateCard(date: index + 4),
            //   ),
            // )
            SizedBox(
                height: 105,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (var i = 0; i < 6; i++)
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: i > 0
                              ? _DateCard(date: i + 4)
                              : _DateCard(
                                  date: i + 4,
                                  primary: true,
                                ),
                        )
                    ],
                  ),
                )),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (ctx, index) => const _Event(),
                  separatorBuilder: (ctx, index) => const SizedBox(
                        height: 8,
                      ),
                  itemCount: 10),
            )
          ],
        ));
  }
}

class _DateCard extends StatelessWidget {
  final int date;
  final bool primary;
  const _DateCard({Key? key, required this.date, this.primary = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8),
      color: primary
          ? swatch.PrimaryColors.blue
          : swatch.SecondaryColors.mediumGray,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "0" + date.toString(),
              style: TxtTheme.largeBold.copyWith(
                  color: primary
                      ? swatch.LabelColors.quarternary
                      : swatch.LabelColors.secondary),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "THU",
              style: TxtTheme.footnote.copyWith(
                  color: primary
                      ? swatch.LabelColors.quarternary
                      : swatch.LabelColors.secondary),
            )
          ],
        ),
      ),
    );
  }
}

class _Event extends StatelessWidget {
  const _Event({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Material(
        borderRadius: BorderRadius.circular(8),
        color: swatch.SecondaryColors.mediumGray,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 16, 16, 16),
          child: Row(
            children: [
              Transform.translate(
                offset: const Offset(-8, 0),
                child: Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                      color: swatch.SecondaryColors.mediumGray,
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                    child: Container(
                      height: 16,
                      width: 16,
                      decoration: BoxDecoration(
                          color: swatch.PrimaryColors.purple,
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Meeting Discord",
                          style: TxtTheme.calloutRegular
                              .copyWith(color: swatch.LabelColors.quarternary),
                        ),
                        const CircleAvatar(
                          radius: 8,
                          backgroundColor: Colors.green,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Discuss Web Design Project",
                      style: TxtTheme.footnote
                          .copyWith(color: swatch.FillColors.secondary),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      "10.00 AM-10.30 AM",
                      style: TxtTheme.body
                          .copyWith(color: swatch.LabelColors.quarternary),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
