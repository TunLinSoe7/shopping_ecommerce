import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_zila/providers/detail_page_provider.dart';
import 'package:shop_zila/widgets/horizontal_text_widget.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.id});
 final int id;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) =>DetailPageProvider(id),
      child: Scaffold(
        bottomNavigationBar: Container(
          margin: const EdgeInsets.all(16),
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.cyan
          ),
          alignment: Alignment.center,
          child: const Text('Add To Cart',style: TextStyle(
              color: Colors.white
          ),),
        ),
        appBar: AppBar(
          title: const Text('Detail Product'),
          centerTitle: true,
        ),
        body: Consumer<DetailPageProvider>(
          builder: (BuildContext context, DetailPageProvider value, Widget? child) {
            return value.productDetail == null ?const Center(child: CircularProgressIndicator(
              color: Colors.cyan,
            )):ProductDetailItemViews(value: value,);
          },
        ),
      ),
    );
  }
}

class ProductDetailItemViews extends StatelessWidget {
  const ProductDetailItemViews({
    super.key, required this.value,
  });
 final DetailPageProvider value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 220,
              width: double.infinity,
              child: CachedNetworkImage(
                height: 220,
                imageUrl: '${value.productDetail?.image}',fit: BoxFit.contain,),
            ),
            const HorizontalTextWidget(title: 'Free Shipping',style: TextStyle(
              color: Colors.cyan,
            ),trailing: Icon(Icons.favorite_outline),contentPadding: EdgeInsets.zero,),
            Text('${value.productDetail?.title} ',style: const TextStyle(
              fontSize: 20,fontWeight: FontWeight.w600,
            ),textAlign: TextAlign.start,),
            Text('${value.productDetail?.description}',style: const TextStyle(
              fontSize: 17,fontWeight: FontWeight.w200,
            ),textAlign: TextAlign.start,),
            const SizedBox(height: 20,),
            Row(
              children: [
                Text('\$ ${value.productDetail?.price}',style: const TextStyle(
                    fontWeight: FontWeight.w600
                ),),
                const Spacer(),
                const Icon(Icons.remove_circle_outline),
                const SizedBox(width: 10,),
                const Text('0'),
                const SizedBox(width: 10,),
                const Icon(Icons.add_circle_outline),
              ],
            ),
            const HorizontalTextWidget(title: 'Have a coupon code?Enter here',contentPadding: EdgeInsets.zero,
              style: TextStyle(
                  color: Colors.grey
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.grey),
              ),
              width: double.infinity,
              height: 60,
              alignment: Alignment.centerLeft,
              child: const TextField(
                decoration: InputDecoration(
                    hintText: 'Enter your coupon code',
                    border: InputBorder.none
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
