import 'package:flutter/material.dart';
import '../theme/textheme.dart';
import '../theme/colortheme.dart' as swatch;

class InputField extends StatelessWidget {
  final Widget icon;
  final TextInputType type;
  final double height;
  final String hint;
  final String label;
  final TextStyle? style;
  const InputField(
      {Key? key,
      required this.type,
      this.height = 56,
      required this.hint,
      required this.label,
      required this.icon,
      this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            label,
            style: style ??
                TxtTheme.calloutRegular
                    .copyWith(color: swatch.LabelColors.secondary),
          ),
          const SizedBox(
            height: 12,
          ),
          TextField(
            cursorColor: Colors.white,
            style: TxtTheme.calloutRegular
                .copyWith(color: swatch.BaseColors.white),
            keyboardType: type,
            obscureText: type == TextInputType.visiblePassword ? true : false,
            decoration: InputDecoration(
              prefixIcon: IconTheme(
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 18, right: 18, bottom: 2),
                  child: icon,
                ),
                data: const IconThemeData(color: Color(0xff8A8A8E)),
              ),
              labelText: hint,
              labelStyle: TxtTheme.calloutRegular
                  .copyWith(color: const Color(0xff8A8A8E)),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              contentPadding: const EdgeInsets.fromLTRB(18, 22, 16, 22),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(height / 2),
                  borderSide:
                      const BorderSide(width: 1, color: Color(0xff8A8A8E))),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(height / 2),
                  borderSide: const BorderSide(width: 1, color: Colors.white)),
            ),
          ),
        ]);
  }
}
