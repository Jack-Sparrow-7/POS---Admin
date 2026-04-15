import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:pos_admin/styles/box_styles.dart';
import 'package:pos_admin/components/nav_bar.dart';
import 'package:pos_admin/screens/dash_board_screen.dart';
import 'package:pos_admin/screens/tenants_screen.dart';
import 'package:pos_admin/styles/text_styles.dart';
import 'package:pos_admin/theme/tokens.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final ValueNotifier<int> currentIndex = ValueNotifier<int>(0);

  final List<Widget> screens = [
    DashBoardScreen(),
    TenantsScreen(),
    const _ComingSoonScreen(title: 'Stores'),
    const _ComingSoonScreen(title: 'Merchants'),
    const _ComingSoonScreen(title: 'Cahiers'),
    const _ComingSoonScreen(title: 'Customers'),
    const _ComingSoonScreen(title: 'Subscriptions'),
    const _ComingSoonScreen(title: 'Reports'),
    const _ComingSoonScreen(title: 'Developer Control'),
    const _ComingSoonScreen(title: 'Settings'),
  ];

  @override
  void dispose() {
    currentIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RowBox(
        children: [
          Box(
            style: card.width(240).paddingAll(0).borderRadiusAll(.circular(0)),
            child: ColumnBox(
              style: FlexBoxStyler().paddingAll(0),
              children: [
                Box(
                  style: BoxStyler()
                      .height(56)
                      .width(.infinity)
                      .padding(.symmetric(horizontal: 16))
                      .borderBottom(color: $border())
                      .alignment(.center),
                  child: StyledText(
                    'Branding',
                    style: bradingText.fontSize(36),
                  ),
                ),

                ValueListenableBuilder<int>(
                  valueListenable: currentIndex,
                  builder: (context, value, child) {
                    return NavBar(
                      selectedIndex: value,
                      onItemSelected: (index) => currentIndex.value = index,
                    );
                  },
                ),
              ],
            ),
          ),

          Expanded(
            child: ColumnBox(
              children: [
                Box(
                  style: BoxStyler()
                      .width(.infinity)
                      .height(57)
                      .color($card())
                      .borderBottom(color: $border())
                      .padding(.symmetric(horizontal: 16)),
                  child: RowBox(
                    style: FlexBoxStyler().mainAxisAlignment(.end),
                    children: [
                      Box(
                        style: BoxStyler()
                            .shape(.circle())
                            .color($primary())
                            .size(32, 32)
                            .alignment(.center),
                        child: StyledText(
                          'D',
                          style: bodyText.color($primaryFg()),
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: ValueListenableBuilder<int>(
                    valueListenable: currentIndex,
                    builder: (context, value, child) {
                      return IndexedStack(index: value, children: screens);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ComingSoonScreen extends StatelessWidget {
  const _ComingSoonScreen({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '$title coming soon',
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
