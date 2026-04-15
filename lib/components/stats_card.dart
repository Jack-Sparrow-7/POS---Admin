import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:mix/mix.dart';
import 'package:pos_admin/styles/box_styles.dart';
import 'package:pos_admin/styles/shadow_styles.dart';
import 'package:pos_admin/styles/text_styles.dart';
import 'package:pos_admin/theme/tokens.dart';

class StatsCard extends StatelessWidget {
  const StatsCard({
    super.key,
    required this.title,
    required this.icon,
    required this.value,
    required this.percent,
  });

  final String title;
  final IconData icon;
  final int value;
  final double percent;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PressableBox(
        onPress: () {},
        style: card.height(96).onHovered(shadowMd),
        child: ColumnBox(
          children: [
            RowBox(
              style: FlexBoxStyler().mainAxisAlignment(.spaceBetween),
              children: [
                StyledText(title, style: bodyText.color($mutedFg())),

                StyledIcon(icon: icon, style: IconStyler.size(18)),
              ],
            ),

            Gap(8),

            RowBox(
              children: [
                StyledText(style: headingLg.fontWeight(.w700), '$value'),

                Gap(8),

                StyledIcon(
                  icon: LucideIcons.trendingUp,
                  style: IconStyler().size(12).color($success()),
                ),

                Gap(2),

                StyledText(
                  '$percent%',
                  style: TextStyler().fontSize(12).color($success()),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
