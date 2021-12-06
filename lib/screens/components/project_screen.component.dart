import 'package:flutter/material.dart';
import '../theme/textheme.dart';
import '../theme/colortheme.dart' as swatch;

class ProjectItem extends StatelessWidget {
  final Function() ontap;
  const ProjectItem({Key? key, required this.ontap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
            color: swatch.SecondaryColors.mediumGray,
            borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsetsDirectional.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Web Design",
                  style: TxtTheme.calloutRegular
                      .copyWith(color: swatch.LabelColors.quarternary),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CircleAvatar(
                      radius: 4,
                      backgroundColor: swatch.PrimaryColors.tosca,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "2 Days Left",
                      style: TxtTheme.footnote
                          .copyWith(color: swatch.FillColors.secondary),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    const Icon(
                      Icons.more_vert_sharp,
                      color: swatch.FillColors.secondary,
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Text(
                  "PT. Ikatan Cinta",
                  style: TxtTheme.footnote
                      .copyWith(color: swatch.FillColors.secondary),
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 8,
                  width: 272,
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
                ),
                Text(
                  "35%",
                  style: TxtTheme.footnote
                      .copyWith(color: swatch.FillColors.secondary),
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CircleAvatar(
                      radius: 4,
                      backgroundColor: swatch.SecondaryColors.lighttosca,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "12 Tasks",
                      style: TxtTheme.footnote
                          .copyWith(color: swatch.FillColors.secondary),
                    )
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (var i = 0; i < 4; i++)
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        child: CircleAvatar(
                          radius: 12,
                          backgroundColor: swatch.LabelColors.tertiary,
                        ),
                      )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
