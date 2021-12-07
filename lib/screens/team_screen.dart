import 'package:flutter/material.dart';
import 'components/buttons.dart';
import 'theme/colortheme.dart' as swatch;
import 'theme/textheme.dart';
import 'components/appbar.dart';
import 'components/team_screen.component.dart';
import 'components/input.dart';

class TeamScreen extends StatelessWidget {
  const TeamScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              clipBehavior: Clip.antiAlias,
              // backgroundColor: swatch.SecondaryColors.mediumGray,
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8))),
              context: context,
              builder: (ctx) => const _AddMemberSheet());
        },
        child: const Icon(
          Icons.add,
          color: swatch.BaseColors.white,
        ),
      ),
      body: Material(
        color: swatch.PrimaryColors.darkGray,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              MyAppBar(
                  horizontalPadding: 0,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BtnFlat(
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: swatch.BaseColors.white,
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    Text(
                      "Parto Team",
                      style: TxtTheme.calloutBold
                          .copyWith(color: swatch.FillColors.primary),
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                  ]),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Wrap(
                    alignment: WrapAlignment.spaceEvenly,
                    spacing: 8,
                    runSpacing: 10,
                    children: [
                      for (var i = 0; i < 8; i++)
                        const TeamMember(
                            statusColor: swatch.PrimaryColors.yellow)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _AddMemberSheet extends StatelessWidget {
  const _AddMemberSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: swatch.SecondaryColors.mediumGray,
      // borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: BtnFlat(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.close,
                  color: swatch.LabelColors.secondary,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              width: double.infinity,
              height: 230,
              decoration: BoxDecoration(
                  color: swatch.SecondaryColors.lighttosca,
                  borderRadius: BorderRadius.circular(8)),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "Add New Task",
              style: TxtTheme.calloutBold
                  .copyWith(color: swatch.LabelColors.quarternary),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Make your team good with us, invite your team members to get going",
                    style: TxtTheme.calloutRegular
                        .copyWith(color: swatch.LabelColors.secondary),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            InputField(
              type: TextInputType.emailAddress,
              hint: "Select Your Team Name",
              label: "Team Members",
              icon: const Icon(Icons.person_add_alt_outlined),
              style: TxtTheme.calloutRegular
                  .copyWith(color: swatch.LabelColors.quarternary),
            ),
            const SizedBox(
              height: 16,
            ),
            BtnFlat(
                child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.add,
                  color: swatch.LabelColors.secondary,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  "Add Member",
                  style: TxtTheme.calloutBold
                      .copyWith(color: swatch.LabelColors.quarternary),
                )
              ],
            )),
            const SizedBox(
              height: 16,
            ),
            BtnPrimary(txt: "Add", onTap: () {})
          ],
        ),
      ),
    );
  }
}
