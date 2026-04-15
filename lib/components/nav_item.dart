import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:pos_admin/styles/text_styles.dart';
import 'package:pos_admin/theme/tokens.dart';

class NavItem extends StatelessWidget {
  const NavItem({
    super.key,
    required this.name,
    required this.icon,
    required this.onPressed,
    this.isSelected = false,
  });

  final String name;
  final IconData icon;
  final VoidCallback onPressed;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return PressableBox(
      onPress: onPressed,
      style: BoxStyler()
          .borderRadiusAll($radiusSm())
          .onHovered(.color($sidebarAccent()))
          .color(isSelected ? $sidebarAccent() : Colors.transparent),
      child: RowBox(
        style: FlexBoxStyler()
            .padding(.symmetric(vertical: 10, horizontal: 12))
            .width(.infinity)
            .spacing(12),
        children: [
          StyledIcon(
            style: IconStyler()
                .size(18)
                .color(isSelected ? $sidebarAccentFg() : $sidebarFg())
                .onHovered(.color($sidebarAccentFg())),
            icon: icon,
          ),

          StyledText(
            style: bodyText
                .color(isSelected ? $sidebarAccentFg() : $sidebarFg())
                .onHovered(.color($sidebarAccentFg()))
                .fontWeight(.w500),
            name,
          ),
        ],
      ),
    );
  }
}
