import 'package:flutter/material.dart';
import 'components/project_screen.component.dart';
import 'theme/textheme.dart';
import 'components/input.dart';
import 'components/buttons.dart';
import 'theme/colortheme.dart' as swatch;

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        width: double.infinity,
        child: Column(
          children: [
            const TabBar(indicatorColor: swatch.PrimaryColors.blue, tabs: [
              Tab(
                child: Text("All"),
              ),
              Tab(
                child: Text("Ongoing"),
              ),
              Tab(
                child: Text("Upcoming"),
              ),
            ]),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: TabBarView(children: [
                SizedBox(
                  width: double.infinity,
                  child: ListView.separated(
                      itemCount: 10,
                      separatorBuilder: (ctx, index) {
                        return const SizedBox(
                          height: 8,
                        );
                      },
                      itemBuilder: (ctx, index) {
                        return const ProjectItem();
                      }),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ListView.separated(
                      itemCount: 2,
                      separatorBuilder: (ctx, index) {
                        return const SizedBox(
                          height: 8,
                        );
                      },
                      itemBuilder: (ctx, index) {
                        return const ProjectItem();
                      }),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ListView.separated(
                      itemCount: 5,
                      separatorBuilder: (ctx, index) {
                        return const SizedBox(
                          height: 8,
                        );
                      },
                      itemBuilder: (ctx, index) {
                        return const ProjectItem();
                      }),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}

class AddProjectSheet extends StatelessWidget {
  const AddProjectSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: swatch.SecondaryColors.mediumGray,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                "Add New Project",
                style: TxtTheme.calloutBold
                    .copyWith(color: swatch.LabelColors.quarternary),
              ),
              BtnFlat(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.close,
                  color: swatch.LabelColors.secondary,
                ),
              ),
            ]),
            const SizedBox(
              height: 16,
            ),
            InputField(
              type: TextInputType.text,
              hint: "Enter Project Name",
              label: "Project Name",
              icon: const Icon(Icons.business_center_outlined),
              style: TxtTheme.calloutRegular
                  .copyWith(color: swatch.LabelColors.quarternary),
            ),
            const SizedBox(
              height: 16,
            ),
            InputField(
              type: TextInputType.text,
              hint: "Select Your Team",
              label: "Assigned To",
              icon: const Icon(Icons.person_add_alt_1_outlined),
              style: TxtTheme.calloutRegular
                  .copyWith(color: swatch.LabelColors.quarternary),
            ),
            const SizedBox(
              height: 16,
            ),
            InputField(
              type: TextInputType.datetime,
              hint: "Ongoing",
              label: "Progress",
              icon: const Icon(Icons.task_outlined),
              style: TxtTheme.calloutRegular
                  .copyWith(color: swatch.LabelColors.quarternary),
            ),
            const SizedBox(
              height: 16,
            ),
            InputField(
              type: TextInputType.datetime,
              hint: "2 March 2021",
              label: "Timeline",
              icon: const Icon(Icons.calendar_today_outlined),
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
                  Icons.link_rounded,
                  color: swatch.LabelColors.secondary,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  "Attached Files",
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
