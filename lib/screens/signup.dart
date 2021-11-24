import 'package:flutter/material.dart';
import 'package:taskman/screens/components/buttons.dart';
import 'package:taskman/screens/components/input.dart';
import 'package:taskman/screens/theme/textheme.dart';
import 'components/appbar.dart';
import 'theme/colortheme.dart' as swatch;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

/// Stuff Starts Here
class _SignUpScreenState extends State<SignUpScreen>
    with TickerProviderStateMixin {
  late TabController tb;
  bool _create = true;
  List<Widget> tabs = [];
  @override
  void initState() {
    super.initState();
    tb = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tb.dispose();
  }

  @override
  Widget build(BuildContext context) {
    tabs = [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InputField(
              type: TextInputType.emailAddress,
              hint: "Enter Your Email Address",
              label: "Your Email Address",
              icon: const Icon(Icons.email_outlined),
              style: TxtTheme.calloutRegular
                  .copyWith(color: swatch.BaseColors.white),
            ),
            const SizedBox(
              height: 16,
            ),
            BtnPrimary(
              txt: "Continue",
              onTap: _nextScreen,
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Complete Your Profiles",
              style: TxtTheme.calloutBold
                  .copyWith(color: swatch.LabelColors.quarternary),
            ),
            const SizedBox(
              height: 16,
            ),
            const CircleAvatar(
              radius: 44,
              backgroundColor: swatch.SecondaryColors.mediumGray,
              child: Icon(Icons.camera_alt_outlined),
            ),
            const SizedBox(
              height: 24,
            ),
            InputField(
                type: TextInputType.name,
                hint: "Enter Your Full Name",
                label: "Your Full Name",
                icon: const Icon(Icons.person_outline_sharp),
                style: TxtTheme.calloutRegular
                    .copyWith(color: swatch.BaseColors.white)),
            const SizedBox(
              height: 16,
            ),
            InputField(
                type: TextInputType.visiblePassword,
                hint: "Enter A New Password",
                label: "Your Password",
                icon: const Icon(Icons.lock_open_outlined),
                style: TxtTheme.calloutRegular
                    .copyWith(color: swatch.BaseColors.white)),
            const SizedBox(
              height: 16,
            ),
            BtnPrimary(txt: "Continue", onTap: _nextScreen)
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Create Your Own Team?",
              style: TxtTheme.calloutBold
                  .copyWith(color: swatch.LabelColors.quarternary),
            ),
            const SizedBox(
              height: 16,
            ),
            InputField(
                type: TextInputType.name,
                hint: "e.g Parto Team",
                label: "Your Team Name",
                icon: const Icon(Icons.person_outline_sharp),
                style: TxtTheme.calloutRegular
                    .copyWith(color: swatch.BaseColors.white)),
            const SizedBox(
              height: 16,
            ),
            BtnPrimary(
              txt: "Create Team",
              onTap: () {
                setState(() {
                  // _create = true;
                  tb.animateTo(tb.index + 2);
                });
              },
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "Or",
              style: TxtTheme.calloutBold
                  .copyWith(color: swatch.LabelColors.quarternary),
            ),
            const SizedBox(
              height: 16,
            ),
            BtnSecondary(
              txt: "Join Team",
              onTap: () {
                setState(() {
                  // _create = false;
                  tb.animateTo(tb.index + 1);
                });
              },
            )
          ],
        ),
      ),
      _joinTeamScr(),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Invite Your Team Members",
              style: TxtTheme.calloutBold
                  .copyWith(color: swatch.LabelColors.quarternary),
            ),
            const SizedBox(
              height: 16,
            ),
            InputField(
                type: TextInputType.emailAddress,
                hint: "Type An Email Address",
                label: "Email Member",
                icon: const Icon(Icons.email_outlined),
                style: TxtTheme.calloutRegular
                    .copyWith(color: swatch.BaseColors.white)),
            const SizedBox(
              height: 16,
            ),
            BtnPrimary(txt: "Invite", onTap: () {}),
            const SizedBox(
              height: 16,
            ),
            BtnSecondary(txt: "Skip", onTap: () {})
          ],
        ),
      )
    ];
    return Scaffold(
      body: Material(
        color: swatch.PrimaryColors.darkGray,
        child: Column(
          children: [
            MyAppBar(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BtnFlat(
                    child: const Icon(Icons.arrow_back_ios),
                    onTap: _previousScreen,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (var i = 0; i < tabs.length; i++)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 150),
                            height: 8,
                            width: tb.index < i ? 16 : 24,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: tb.index < i
                                  ? swatch.SecondaryColors.mediumGray
                                  : swatch.PrimaryColors.blue,
                            ),
                          ),
                        )
                    ],
                  ),
                  const SizedBox(
                    width: 24,
                  )
                ]),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: TabBarView(
                children: tabs,
                controller: tb,
                physics: const NeverScrollableScrollPhysics(),
              ),
            )
          ],
        ),
      ),
    );
  }

  _nextScreen() {
    setState(() {
      tb.animateTo(tb.index + 1);
    });
  }

  _previousScreen() {
    if (tb.index > 0) {
      setState(() {
        tb.animateTo(tb.index - 1);
      });
    }
  }

  Widget _joinTeamScr() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Enter Your Team Code",
          style: TxtTheme.calloutBold
              .copyWith(color: swatch.LabelColors.quarternary),
        ),
        const SizedBox(
          height: 16,
        ),
        InputField(
            type: TextInputType.text,
            hint: "e.g JXHIJK",
            label: "Your Team Code",
            icon: const Icon(Icons.code_outlined),
            style: TxtTheme.calloutRegular
                .copyWith(color: swatch.BaseColors.white)),
        const SizedBox(
          height: 16,
        ),
        BtnPrimary(txt: "Join", onTap: _nextScreen)
      ],
    );
  }
}
