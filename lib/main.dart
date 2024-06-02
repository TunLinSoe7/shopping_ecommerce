import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:shop_zila/data/vos/product_vo.dart';
import 'package:shop_zila/data/vos/rating_vo.dart';
import 'package:shop_zila/navigation_menu.dart';
import 'package:shop_zila/utils/constants/hive_constant.dart';
import 'pages/menu_screen_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main()async{
  await Hive.initFlutter();
  Hive.registerAdapter(ProductVOAdapter());
  Hive.registerAdapter(RatingVOAdapter());
  await Hive.openBox<ProductVO>(kBoxNameForProductVO);
  await Hive.openBox<RatingVO>(kBoxNameForRatingVO);
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
