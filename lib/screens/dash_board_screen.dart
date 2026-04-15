import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:mix/mix.dart';
import 'package:pos_admin/components/stats_card.dart';
import 'package:pos_admin/styles/box_styles.dart';
import 'package:pos_admin/styles/text_styles.dart';
import 'package:pos_admin/theme/tokens.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isMobile = screenWidth < 600;
    final isDesktop = screenWidth >= 1024;
    final columns = screenWidth >= 1200
        ? 4
        : screenWidth >= 600
        ? 2
        : 1;

    final statCards = [
      StatsCard(
        title: 'Total Tenants',
        icon: LucideIcons.building2,
        value: 24,
        percent: 8.3,
      ),
      StatsCard(
        title: 'Active Stores',
        icon: LucideIcons.store,
        value: 156,
        percent: 12.5,
      ),
      StatsCard(
        title: 'Active Merchants',
        icon: LucideIcons.userCog,
        value: 89,
        percent: 5.1,
      ),
      StatsCard(
        title: 'Active Cashiers',
        icon: LucideIcons.userCheck,
        value: 312,
        percent: 15.7,
      ),
    ];

    final actions = [
      outlinedButton(
        name: 'Refresh',
        icon: LucideIcons.refreshCw,
        onPressed: () {},
      ),
      outlinedButton(
        name: 'Export',
        icon: LucideIcons.download,
        onPressed: () {},
      ),
    ];

    final panels = [
      Box(
        style: card.height(338),
        child: ColumnBox(
          children: [
            Align(
              alignment: .centerLeft,
              child: StyledText('Orders & Revenue Trend', style: headingMd),
            ),

            Gap(16),
            
          ],
        ),
      ),
      Box(style: card.height(338)),
    ];

    return SingleChildScrollView(
      child: ColumnBox(
        style: FlexBoxStyler().paddingAll(isMobile ? 16 : 24),
        children: [
          isMobile
              ? ColumnBox(
                  style: FlexBoxStyler().spacing(12),
                  children: [
                    headingLg('Dashboard'),
                    Wrap(spacing: 8, runSpacing: 8, children: actions),
                  ],
                )
              : RowBox(
                  style: FlexBoxStyler().mainAxisAlignment(.spaceBetween),
                  children: [
                    headingLg('Dashboard'),
                    RowBox(
                      style: FlexBoxStyler().spacing(8),
                      children: actions,
                    ),
                  ],
                ),

          Gap(24),

          ColumnBox(
            style: FlexBoxStyler().spacing(16),
            children: List.generate((statCards.length / columns).ceil(), (
              rowIndex,
            ) {
              final start = rowIndex * columns;
              final rowCards = statCards.skip(start).take(columns).toList();

              return RowBox(
                style: FlexBoxStyler().spacing(16),
                children: [
                  ...rowCards,
                  ...List.generate(
                    columns - rowCards.length,
                    (_) => const Expanded(child: SizedBox.shrink()),
                  ),
                ],
              );
            }),
          ),

          Gap(24),

          FlexBox(
            style: FlexBoxStyler().column().onDesktop(.row()).spacing(16),
            children: panels
                .map((panel) => isDesktop ? Expanded(child: panel) : panel)
                .toList(),
          ),
        ],
      ),
    );
  }

  PressableBox outlinedButton({
    required String name,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return PressableBox(
      onPress: onPressed,
      style: BoxStyler()
          .height(36)
          .padding(.symmetric(horizontal: 12))
          .borderRadiusAll($radiusSm())
          .borderAll(color: $border())
          .onHovered(.color($accent())),
      child: RowBox(
        style: FlexBoxStyler().spacing(8),
        children: [
          StyledIcon(icon: icon, style: IconStyler().size(16)),

          StyledText(name, style: bodyText.fontWeight(.w600)),
        ],
      ),
    );
  }
}
