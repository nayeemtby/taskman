import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'components/appbar.dart';
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
                        return ProjectItem(
                          ontap: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (ctx) =>
                                        const ProjectDetailsScreen()));
                          },
                        );
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
                        return ProjectItem(
                          ontap: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (ctx) =>
                                        const ProjectDetailsScreen()));
                          },
                        );
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
                        return ProjectItem(
                          ontap: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (ctx) =>
                                        const ProjectDetailsScreen()));
                          },
                        );
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

class ProjectDetailsScreen extends StatelessWidget {
  const ProjectDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8))),
              context: context,
              builder: (ctx) => _AddTagSheet());
        },
        backgroundColor: swatch.PrimaryColors.blue,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BtnFlat(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: swatch.BaseColors.white,
                            )),
                        Text(
                          "Project Details",
                          style: TxtTheme.calloutBold
                              .copyWith(color: swatch.FillColors.primary),
                        ),
                        const Icon(Icons.more_vert_rounded)
                      ]),
                  const SizedBox(
                    height: 8,
                  ),
                  Expanded(
                      child: ListView(
                    children: [
                      Material(
                        color: swatch.SecondaryColors.mediumGray,
                        borderRadius: BorderRadius.circular(8),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: SizedBox(
                            width: double.infinity,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Web Design - PT Mencari Cinta Sejati",
                                  style: TxtTheme.titleLarge.copyWith(
                                      color: swatch.LabelColors.quarternary),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      height: 8,
                                      width: 8,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          color: swatch
                                              .SecondaryColors.lighttosca),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      "12 Tasks",
                                      style: TxtTheme.footnote.copyWith(
                                          color: swatch.FillColors.secondary),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  "Goals",
                                  style: TxtTheme.calloutRegular.copyWith(
                                      color: swatch.FillColors.secondary),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipis cing elit. Sit tristique porttitor magna turpis consequat, sed. At urna, cras ultricies tristique.",
                                  style: TxtTheme.calloutRegular.copyWith(
                                      color: swatch.LabelColors.quarternary),
                                ),
                                const SizedBox(
                                  height: 26,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                          "March 13, 17:00 PM",
                                          style: TxtTheme.footnote.copyWith(
                                              color: swatch
                                                  .LabelColors.quarternary),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Icon(
                                          Icons.business_center_outlined,
                                          color: swatch.FillColors.secondary,
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          "Medium Project",
                                          style: TxtTheme.footnote.copyWith(
                                              color: swatch
                                                  .LabelColors.quarternary),
                                        )
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Material(
                        color: swatch.SecondaryColors.mediumGray,
                        borderRadius: BorderRadius.circular(8),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: SizedBox(
                            width: double.infinity,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Tasks (5/12)",
                                      style: TxtTheme.calloutBold.copyWith(
                                          color:
                                              swatch.LabelColors.quarternary),
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    Expanded(
                                        child: Container(
                                      width: double.infinity,
                                      height: 16,
                                      decoration: BoxDecoration(
                                          color: swatch.progressbarBg,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                          height: 16,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              color:
                                                  swatch.PrimaryColors.purple,
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                        ),
                                      ),
                                    ))
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    for (var i = 0; i < 8; i++)
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0),
                                        child: InkWell(
                                          onTap: () {},
                                          child: Padding(
                                            padding: const EdgeInsets.all(16),
                                            child: Row(
                                              children: [
                                                const Icon(
                                                  Icons.check_box_outlined,
                                                  color: swatch.separatorColor,
                                                ),
                                                const SizedBox(
                                                  width: 8,
                                                ),
                                                Text(
                                                  "Research Analysis",
                                                  style: TxtTheme.calloutRegular
                                                      .copyWith(
                                                          color: swatch
                                                              .LabelColors
                                                              .quarternary),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ))
                ],
              ))),
    );
  }
}

class _AddTagSheet extends StatelessWidget {
  final List<List<Color>> _colors = [
    [
      swatch.PrimaryColors.blue,
      swatch.PrimaryColors.pink,
      swatch.PrimaryColors.yellow,
      swatch.PrimaryColors.purple,
      swatch.PrimaryColors.tosca,
    ],
    [
      swatch.SecondaryColors.lightblue,
      swatch.SecondaryColors.lightpink,
      swatch.SecondaryColors.lightyellow,
      swatch.SecondaryColors.lightpurple,
      swatch.SecondaryColors.lighttosca
    ],
    [
      swatch.FillColors.primary,
      swatch.FillColors.secondary,
      swatch.LabelColors.secondary,
      swatch.LabelColors.tertiary,
      swatch.LabelColors.quarternary
    ]
  ];
  _AddTagSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: swatch.SecondaryColors.mediumGray,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Add Tags",
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
                    ))
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            InputField(
              type: TextInputType.text,
              hint: "Enter Your Name Tags",
              label: "Tag Name",
              icon: const SizedBox(
                width: 8,
              ),
              style: TxtTheme.calloutRegular
                  .copyWith(color: swatch.LabelColors.quarternary),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "Color",
              style: TxtTheme.calloutRegular
                  .copyWith(color: swatch.LabelColors.quarternary),
            ),
            const SizedBox(
              height: 16,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                for (var i = 0; i < 3; i++)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (var j = 0; j < 5; j++)
                          Container(
                            height: 48,
                            width: 48,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              color: _colors[i][j],
                            ),
                          )
                      ],
                    ),
                  )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            BtnPrimary(
                txt: "Done",
                onTap: () {
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }
}
