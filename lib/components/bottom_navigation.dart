import 'package:ecommerce_final_project/screens/cart_screen.dart';
import 'package:ecommerce_final_project/screens/favorite_screen.dart';
import 'package:ecommerce_final_project/screens/home_screen.dart';
import 'package:ecommerce_final_project/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {


  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      tabs: [
        PersistentTabConfig(
          screen: HomeScreen(),
          item: ItemConfig(
            icon: Icon(Icons.home),
            title: "Home",
          ),
        ),
        PersistentTabConfig(
          screen: CartScreen(),
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
          screen: ProfileScreen(),
          item: ItemConfig(
            icon: Icon(Icons.person_outline_outlined),
            title: "Profile",
          ),
        ),
      ],
      navBarBuilder: (navBarConfig) => Style1BottomNavBar(
        navBarConfig: navBarConfig,
      ),
    );
  }
}
