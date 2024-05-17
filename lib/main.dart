import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:shop_zila/navigation_menu.dart';
import 'pages/menu_screen_page.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
          home: ZoomDrawer(
              angle: 0,
              mainScreenScale: 0.1,
              borderRadius: 40,
              menuScreen: MenuScreenPage(), mainScreen: NavigationMenu()),
    );
  }
}
