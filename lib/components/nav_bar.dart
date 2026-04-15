import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:mix/mix.dart';
import 'package:pos_admin/components/nav_item.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  final int selectedIndex;
  final ValueChanged<int> onItemSelected;

  @override
  Widget build(BuildContext context) {
    return ColumnBox(
      style: FlexBoxStyler().paddingAll(12).spacing(2),
      children: <NavItem>[
        NavItem(
          name: 'Dashboard',
          icon: LucideIcons.layoutDashboard,
          isSelected: selectedIndex == 0,
          onPressed: () => onItemSelected(0),
        ),

        NavItem(
          name: 'Tenants',
          icon: LucideIcons.building2,
          isSelected: selectedIndex == 1,
          onPressed: () => onItemSelected(1),
        ),

        NavItem(
          name: 'Stores',
          icon: LucideIcons.store,
          isSelected: selectedIndex == 2,
          onPressed: () => onItemSelected(2),
        ),

        NavItem(
          name: 'Merchants',
          icon: LucideIcons.userCog,
          isSelected: selectedIndex == 3,
          onPressed: () => onItemSelected(3),
        ),

        NavItem(
          name: 'Cahiers',
          icon: LucideIcons.userCheck,
          isSelected: selectedIndex == 4,
          onPressed: () => onItemSelected(4),
        ),

        NavItem(
          name: 'Customers',
          icon: LucideIcons.users,
          isSelected: selectedIndex == 5,
          onPressed: () => onItemSelected(5),
        ),

        NavItem(
          name: 'Subscriptions',
          icon: LucideIcons.receipt,
          isSelected: selectedIndex == 6,
          onPressed: () => onItemSelected(6),
        ),

        NavItem(
          name: 'Reports',
          icon: LucideIcons.chartColumn,
          isSelected: selectedIndex == 7,
          onPressed: () => onItemSelected(7),
        ),

        NavItem(
          name: 'Developer Control',
          icon: LucideIcons.codeXml,
          isSelected: selectedIndex == 8,
          onPressed: () => onItemSelected(8),
        ),

        NavItem(
          name: 'Settings',
          icon: LucideIcons.settings,
          isSelected: selectedIndex == 9,
          onPressed: () => onItemSelected(9),
        ),
      ],
    );
  }
}
