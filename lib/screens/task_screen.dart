import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskman/screens/components/appbar.dart';
import 'package:taskman/screens/components/task_screen.component.dart';
import 'package:taskman/screens/theme/textheme.dart';
import 'theme/colortheme.dart' as swatch;

class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Material(
            elevation: 0,
            borderRadius: BorderRadius.circular(32),
            color: swatch.PrimaryColors.blue,
            child: InkWell(
                splashFactory: InkRipple.splashFactory,
                borderRadius: BorderRadius.circular(32),
                onTap: () {},
                child: const SizedBox(
                  height: 64,
                  width: 64,
                  child: Center(
                    child: Icon(Icons.add),
                  ),
                )),
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
