
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductItemView extends StatelessWidget{
  const ProductItemView({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white
      ),
      width: double.infinity,
      height: 100,
      child: CachedNetworkImage(imageUrl: imageUrl),
    );
  }

}