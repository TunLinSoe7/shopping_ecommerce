import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:shop_zila/providers/navigation_provider.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NavigationMenuProvider(),
      child: Consumer<NavigationMenuProvider>(
        builder: (_, provider, __) => Scaffold(
          bottomNavigationBar: NavigationBar(
            backgroundColor: Colors.white,
            height: 80,
            elevation: 0,
            selectedIndex: provider.selectedIndex,
            onDestinationSelected: (index) => provider.setIndex(index),
            destinations: const [
              NavigationDestination(
                  icon: Icon(
                    Iconsax.home,
                    color: Colors.cyan,
                  ),
                  label: 'Home'),
              NavigationDestination(
                  icon: Icon(
                    Iconsax.shopping_cart,
                    color: Colors.cyan,
                  ),
                  label: 'Cart'),
              NavigationDestination(
                  icon: Icon(
                    Iconsax.heart,
                    color: Colors.cyan,
                  ),
                  label: 'WishList'),
              NavigationDestination(
                  icon: Icon(
                    Iconsax.user,
                    color: Colors.cyan,
                  ),
                  label: 'Profile'),
            ],
          ),
          body: IndexedStack(
            index: provider.selectedIndex,
            children: provider.screens,
          ),
        ),
      ),
    );
  }
}
