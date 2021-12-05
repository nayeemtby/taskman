import 'package:flutter/material.dart';
import 'package:taskman/screens/theme/textheme.dart';
import 'theme/colortheme.dart' as swatch;

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircleAvatar(
                radius: 32,
                backgroundColor: swatch.SecondaryColors.mediumGray,
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Shoo Phar Nha",
                    style: TxtTheme.titleSmall
                        .copyWith(color: swatch.LabelColors.quarternary),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "xDesign Team",
                    style: TxtTheme.calloutRegular
                        .copyWith(color: swatch.FillColors.secondary),
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Expanded(
              child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Material(
              color: swatch.SecondaryColors.mediumGray,
              borderRadius: BorderRadius.circular(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      "You",
                      style: TxtTheme.calloutBold
                          .copyWith(color: swatch.LabelColors.quarternary),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const _Button(txt: "My Information"),
                  const SizedBox(
                    height: 8,
                  ),
                  const _Button(txt: "Change Password"),
                  const SizedBox(
                    height: 8,
                  ),
                  const _Button(txt: "Change Email"),
                  const SizedBox(
                    height: 8,
                  ),
                  const _Button(txt: "More Settings..."),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      "Help",
                      style: TxtTheme.calloutBold
                          .copyWith(color: swatch.LabelColors.quarternary),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const _Button(txt: "FAQ"),
                  const SizedBox(
                    height: 8,
                  ),
                  const _Button(txt: "Support Inbox"),
                  const SizedBox(
                    height: 8,
                  ),
                  const _Button(txt: "Licenses"),
                  const SizedBox(
                    height: 8,
                  ),
                  const _Button(txt: "Privacy Policy"),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}

class _Button extends StatelessWidget {
  final String txt;
  final TextStyle? style;
  const _Button({Key? key, required this.txt, this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: InkRipple.splashFactory,
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              txt,
              style: style ??
                  TxtTheme.calloutRegular
                      .copyWith(color: swatch.LabelColors.quarternary),
            ),
            const Icon(Icons.arrow_forward_ios_rounded)
          ],
        ),
      ),
    );
  }
}
