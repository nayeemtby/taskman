import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:taskman/screens/components/appbar.dart';
import 'package:taskman/screens/components/task_screen.component.dart';
import 'package:taskman/screens/theme/textheme.dart';
import 'components/shared.components.dart';
import 'theme/colortheme.dart' as swatch;

class TaskScreen extends StatelessWidget {
  final bool showTeamCreated;
  const TaskScreen({Key? key, this.showTeamCreated = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (showTeamCreated) {
      Future.delayed(
          Duration.zero,
          () => showDialog(
              context: context, builder: (ctx) => const TeamCreatedDialog()));
    }
    // Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Material(
            elevation: 0,
            borderRadius: BorderRadius.circular(40),
            color: swatch.PrimaryColors.blue,
            child: Builder(builder: (context) {
              return InkWell(
                  splashFactory: InkRipple.splashFactory,
                  borderRadius: BorderRadius.circular(40),
                  onTap: () {
                    showModalBottomSheet(
                        clipBehavior: Clip.hardEdge,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8))),
                        context: context,
                        builder: (context) => const AddTaskSheet());
                  },
                  child: const SizedBox(
                    height: 80,
                    width: 80,
                    child: Center(
                      child: Icon(Icons.add),
                    ),
                  ));
            }),
          ),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: swatch.LabelColors.quarternary,
          selectedLabelStyle:
              TxtTheme.caption2.copyWith(color: swatch.LabelColors.quarternary),
          unselectedItemColor: swatch.LabelColors.secondary,
          items: const [
            BottomNavigationBarItem(label: "My Task", icon: Icon(Icons.task)),
            BottomNavigationBarItem(
                label: "Calendar", icon: Icon(Icons.calendar_today_outlined)),
            BottomNavigationBarItem(
                tooltip: "",
                label: "",
                icon: SizedBox(
                  height: 12,
                  width: 12,
                )),
            BottomNavigationBarItem(label: "Project", icon: Icon(Icons.list)),
            BottomNavigationBarItem(label: "Profile", icon: Icon(Icons.person))
          ],
          backgroundColor: swatch.SecondaryColors.mediumGray,
        ),
        body: Material(
          color: swatch.PrimaryColors.darkGray,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            width: double.infinity,
            child: Column(
              children: [
                MyAppBar(
                    horizontalPadding: 0,
                    verticalPadding: 12,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const CircleAvatar(
                            radius: 16,
                            backgroundColor: swatch.SecondaryColors.mediumGray,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Parto Team",
                            style: TxtTheme.calloutBold
                                .copyWith(color: swatch.FillColors.primary),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          const Icon(Icons.keyboard_arrow_down_outlined)
                        ],
                      ),
                      const Icon(Icons.search)
                    ]),
                const SizedBox(
                  height: 16,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Project Task",
                    style: TxtTheme.calloutBold
                        .copyWith(color: swatch.FillColors.primary),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          height: 60,
                          child: ListView(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            children: const [
                              TaskCategory(
                                  name: "Ongoing",
                                  count: 5,
                                  color: swatch.PrimaryColors.purple),
                              SizedBox(
                                width: 8,
                              ),
                              TaskCategory(
                                  name: "Upcoming",
                                  count: 7,
                                  color: swatch.PrimaryColors.pink),
                              SizedBox(
                                width: 8,
                              ),
                              TaskCategory(
                                  name: "Done",
                                  count: 2,
                                  color: swatch.PrimaryColors.tosca),
                              SizedBox(
                                width: 8,
                              ),
                              TaskCategory(
                                  name: "Proposed",
                                  count: 10,
                                  color: swatch.PrimaryColors.yellow)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "My Task",
                        style: TxtTheme.calloutBold
                            .copyWith(color: swatch.LabelColors.quarternary),
                      ),
                      Text(
                        "See More",
                        style: TxtTheme.calloutRegular
                            .copyWith(color: swatch.FillColors.secondary),
                      )
                    ]),
                Expanded(
                    child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: const [
                    TaskItem(
                        tag: TaskTag.urgent,
                        title: "Research Analysis",
                        total: 20,
                        done: 5),
                    SizedBox(
                      height: 8,
                    ),
                    TaskItem(
                        tag: TaskTag.inReview,
                        title: "Presentation",
                        total: 20,
                        done: 5),
                    SizedBox(
                      height: 8,
                    ),
                    TaskItem(
                        tag: TaskTag.inProgress,
                        title: "UI to code",
                        total: 20,
                        done: 5),
                    SizedBox(
                      height: 8,
                    ),
                    TaskItem(
                        tag: TaskTag.approve,
                        title: "UI Draft",
                        total: 20,
                        done: 5),
                    SizedBox(
                      height: 8,
                    ),
                    TaskItem(
                        tag: TaskTag.urgent,
                        title: "Research Analysis",
                        total: 20,
                        done: 5),
                    SizedBox(
                      height: 8,
                    ),
                    TaskItem(
                        tag: TaskTag.approve,
                        title: "Wireframe Building",
                        total: 20,
                        done: 5),
                    SizedBox(
                      height: 8,
                    ),
                    TaskItem(
                        tag: TaskTag.urgent,
                        title: "Research Analysis",
                        total: 20,
                        done: 5),
                    SizedBox(
                      height: 8,
                    ),
                    TaskItem(
                        tag: TaskTag.inReview,
                        title: "Research Analysis",
                        total: 20,
                        done: 5),
                    SizedBox(
                      height: 8,
                    ),
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
