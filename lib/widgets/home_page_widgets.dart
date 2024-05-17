import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_zila/utils/constants/sizes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../data/vos/product_vo.dart';
import '../item_views/product_item_view.dart';
import '../providers/home_page_provider.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.pageIndex, required this.value, required this.index,
  });

  final HomePageProvider pageIndex;
  final HomePageProvider value;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        pageIndex.setCategoryIndex(index);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: kPAndM10S),padding: const EdgeInsets.all(kPAndM5S),
        decoration:BoxDecoration(
            color:index == pageIndex.getCategoryCurrentIndex?Colors.grey.withOpacity(0.3):Colors.white38,
            borderRadius: BorderRadius.circular(kPAndM5S),
          border: Border.all(
            color: Colors.grey.shade200
          )
        ) ,
        child: Center(child: Text("${value.categories?[index]}",textAlign: TextAlign.center,style: const TextStyle(
          color: Colors.black
        ),)),
      ),
    );
  }
}

class SmoothPageIndicatorWidget extends StatelessWidget {
  const SmoothPageIndicatorWidget({
    super.key,
    required this.pageIndex, this.value,
  });

  final HomePageProvider pageIndex;
  final List<ProductVO>? value;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: PageController(
        initialPage: pageIndex.getSliderCurrentIndex,
      ),
      count: value?.length ?? 0,
      effect: const ExpandingDotsEffect(
        activeDotColor: Colors.cyan,
        dotHeight: kPAndM10S,
        dotWidth: kPAndM10S,
      ),);
  }
}

class PromoSliderWidget extends StatelessWidget {
  const PromoSliderWidget({
    super.key,
    required this.pageIndex, this.value,
  });

  final HomePageProvider pageIndex;
  final List<ProductVO>? value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CarouselSlider.builder(itemCount:value?.length ?? 0, itemBuilder: (_,index,realIndex){
        return ProductItemView(imageUrl: '${value?[index].image}');
      }, options: CarouselOptions(
          enlargeCenterPage: true,
          autoPlay: true,
          onPageChanged: (index,reason){
            pageIndex.setSliderCurrentIndex(index);
          }
      )),
    );
  }
}

class SearchContainerWidget extends StatelessWidget {
  const SearchContainerWidget({
    super.key, required this.text, required this.iconData,
  });
  final String text;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: kPAndM16S,right: kPAndM16S),
      padding: const EdgeInsets.all(kPAndM10S),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kPAndM8S),
          color: Colors.grey.withOpacity(kPAndM01S)
      ),
      width: double.infinity,
      child:Center(
        child: Row(
          children: [
            Text(text),
            const Spacer(),
            Icon(iconData),
          ],
        ),
      ),
    );
  }
}



