import 'package:flutter/material.dart';
import '../theme/textheme.dart';
import '../theme/colortheme.dart' as swatch;

class TeamMember extends StatelessWidget {
  const TeamMember({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 135,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: swatch.SecondaryColors.mediumGray,
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    maxRadius: 24,
                    backgroundColor: Colors.grey[600],
                  ),
                  const Positioned(
                      right: 0,
                      bottom: 0,
                      child: CircleAvatar(
                        radius: 6,
                        backgroundColor: Color(0xff00CC39),
                      ))
                ],
              ),
              const Icon(Icons.more_vert)
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            "Shoo Phar Nho",
            style: TxtTheme.calloutBold
                .copyWith(color: swatch.LabelColors.quarternary),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            "abc@gmail.com",
            style:
                TxtTheme.footnote.copyWith(color: swatch.FillColors.secondary),
          )
        ],
      ),
    );
  }
}
