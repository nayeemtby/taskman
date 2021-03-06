import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskman/screens/calender_page.dart';
import 'package:taskman/screens/components/buttons.dart';
import 'package:taskman/screens/profile_page.dart';
import 'package:taskman/screens/project_page.dart';
import 'components/appbar.dart';
import 'theme/textheme.dart';
import 'theme/colortheme.dart' as swatch;
import 'components/task_screen.component.dart';
import 'task_page.dart';
import 'team_screen.dart';

class HomeScreen extends StatefulWidget {
  final bool showTeamCreated;
  const HomeScreen({Key? key, this.showTeamCreated = false}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  late PageController _pageController;
  final List<Widget?> _sheets = [
    const AddTaskSheet(),
    null,
    null,
    const AddProjectSheet()
  ];
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _changeScreen(int index) {
    if (index != 2) {
      _pageController.jumpToPage(index);
      setState(() {
        _currentIndex = index;
      });
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _changeScreen,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: swatch.LabelColors.quarternary,
        selectedLabelStyle: TxtTheme.caption2,
        unselectedLabelStyle: TxtTheme.caption2,
        unselectedItemColor: swatch.LabelColors.secondary,
        items: const [
          BottomNavigationBarItem(
              label: "My Task", icon: Icon(Icons.task_outlined)),
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
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Container(
          height: 96,
          width: 96,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(48),
              color: swatch.SecondaryColors.mediumGray),
          child: Center(
            child: Material(
              elevation: 0,
              borderRadius: BorderRadius.circular(40),
              color: swatch.PrimaryColors.blue,
              child: Builder(builder: (context) {
                return InkWell(
                    splashFactory: InkRipple.splashFactory,
                    borderRadius: BorderRadius.circular(40),
                    onTap: () {
                      if (_currentIndex == 0 || _currentIndex == 3) {
                        showModalBottomSheet(
                            clipBehavior: Clip.hardEdge,
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8))),
                            context: context,
                            builder: (context) => _sheets[_currentIndex]!);
                      }
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
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      body: Material(
        color: swatch.PrimaryColors.darkGray,
        child: Column(
          children: [
            MyAppBar(
                horizontalPadding: 16,
                verticalPadding: 12,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _currentIndex != 4
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const CircleAvatar(
                              radius: 16,
                              backgroundColor:
                                  swatch.SecondaryColors.mediumGray,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            BtnFlat(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (ctx) => const TeamScreen()));
                              },
                              child: Text(
                                "Parto Team",
                                style: TxtTheme.calloutBold
                                    .copyWith(color: swatch.FillColors.primary),
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            const Icon(Icons.keyboard_arrow_down_outlined)
                          ],
                        )
                      : BtnFlat(
                          onTap: () {},
                          child: Text(
                            "My Profile",
                            style: TxtTheme.calloutBold.copyWith(
                                color: swatch.LabelColors.quarternary),
                          ),
                        ),
                  _currentIndex != 4
                      ? const Icon(Icons.search)
                      : BtnFlat(
                          onTap: () {},
                          child: Text(
                            "Sign Out",
                            style: TxtTheme.calloutBold
                                .copyWith(color: const Color(0xffff4343)),
                          ),
                        )
                ]),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  TaskPage(),
                  CalendarPage(),
                  SizedBox(),
                  ProjectScreen(),
                  ProfilePage()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
