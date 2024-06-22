import 'package:ecommerce_final_project/screens/favorite_screen.dart';
import 'package:ecommerce_final_project/screens/order/layout_order.dart';
import 'package:ecommerce_final_project/screens/settings/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import '../screens/home/layout_home.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key, this.index = 0});

  final int? index;

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  late PersistentTabController _navigationController;

  @override
  void initState() {
    super.initState();
    if (widget.index != 0) {
      _navigationController =
          PersistentTabController(initialIndex: widget.index!);
    } else {
      _navigationController = PersistentTabController(initialIndex: 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      controller: _navigationController,
      navBarHeight: 70,
      tabs: [
        PersistentTabConfig(
          screen: LayoutHome(),
          item: ItemConfig(
            icon: Icon(Icons.home),
            title: "Home",
          ),
        ),
        PersistentTabConfig(
          screen: LayoutOrder(),
          item: ItemConfig(
            icon: Icon(Icons.shopping_cart),
            title: "My Order",
          ),
        ),
        PersistentTabConfig(
          screen: FavoriteScreen(),
          item: ItemConfig(
            icon: Icon(Icons.favorite_border_outlined),
            title: "Favorite",
          ),
        ),
        PersistentTabConfig(
          screen: SettingsScreen(),
          item: ItemConfig(
            icon: Icon(Icons.settings),
            title: "Settings",
          ),
        ),
      ],
      navBarBuilder: (navBarConfig) => Style1BottomNavBar(
        navBarConfig: navBarConfig,
        navBarDecoration: NavBarDecoration(
            padding: EdgeInsets.only(top: 13, bottom: 15),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, -1),
                blurRadius: 2,
              )
            ]),
      ),
    );
  }
}
