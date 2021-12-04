import 'package:flutter/material.dart';
import 'components/project_screen.component.dart';
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
                Container(
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
                Container(
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
                Container(
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
