import 'package:flutter/material.dart';
import 'package:taskman/screens/theme/textheme.dart';
import 'components/onboarding.component.dart';
import 'components/buttons.dart';
import 'theme/colortheme.dart' as swatch;

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final style = TxtTheme.largeBold.copyWith(color: swatch.FillColors.primary);
    return Scaffold(
      body: Material(
        color: swatch.PrimaryColors.darkGray,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Transform.translate(
              offset: const Offset(-15, -120),
              child: RRectanglePlaceHolder(
                size: size,
              ),
            ),
            // Text(size.height.toString() + "x" + size.width.toString()),
            const Expanded(child: TextCaroussel()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: BtnPrimary(
                txt: "Sign Up",
                onTap: () {},
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 53),
              child: BtnSecondary(
                txt: "Log In",
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
