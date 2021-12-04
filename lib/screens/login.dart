import 'package:flutter/material.dart';
import 'package:taskman/screens/components/appbar.dart';
import 'package:taskman/screens/components/buttons.dart';
import 'package:taskman/screens/components/input.dart';
import 'package:taskman/screens/theme/textheme.dart';
import 'theme/colortheme.dart' as swatch;

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        color: swatch.PrimaryColors.darkGray,
        child: Column(
          children: [
            MyAppBar(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const BtnFlat(
                    child: Icon(
                      Icons.close,
                    ),
                  ),
                  BtnFlat(
                    child: Text("Sign Up",
                        style: TxtTheme.calloutBold
                            .copyWith(color: swatch.FillColors.primary)),
                  )
                ]),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const InputField(
                      type: TextInputType.emailAddress,
                      hint: "Enter Your Email Address",
                      label: "Your Email Address",
                      icon: Icon(Icons.email_outlined)),
                  const SizedBox(
                    height: 16,
                  ),
                  const InputField(
                      hint: "Enter Your Password",
                      type: TextInputType.visiblePassword,
                      label: "Your Password",
                      icon: Icon(Icons.vpn_key_outlined)),
                  const SizedBox(
                    height: 16,
                  ),
                  BtnPrimary(
                    txt: "Login",
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  InkWell(
                    splashFactory: InkRipple.splashFactory,
                    onTap: () {},
                    child: BtnFlat(
                      child: Text(
                        "Forgot Your Password",
                        style: TxtTheme.calloutRegular
                            .copyWith(color: swatch.LabelColors.quarternary),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
