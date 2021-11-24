import 'package:flutter/material.dart';
import 'components/buttons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'theme/textheme.dart';
import 'theme/colortheme.dart' as swatch;

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        color: swatch.PrimaryColors.darkGray,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 53, left: 16, right: 16),
          child: Column(
            children: [
              Expanded(
                  child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      'assets/images/logo.svg',
                      height: 96,
                      width: 96,
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Text(
                      "RANCANG",
                      style: TxtTheme.largeBold.copyWith(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Your Personal Task Manager",
                      style: TxtTheme.headlineRegular
                          .copyWith(color: Colors.white),
                    )
                  ],
                ),
              )),
              const BtnPrimaryAlt(txt: "Getting Started"),
            ],
          ),
        ),
      ),
    );
  }
}
