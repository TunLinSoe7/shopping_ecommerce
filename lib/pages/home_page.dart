import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:shop_zila/data/vos/product_vo.dart';
import 'package:shop_zila/pages/detail_page.dart';
import 'package:shop_zila/providers/home_page_provider.dart';
import 'package:shop_zila/utils/constants/sizes.dart';
import 'package:shop_zila/utils/constants/strings.dart';
import '../widgets/home_page_widgets.dart';
import '../widgets/horizontal_text_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomePageProvider>(
      create: (BuildContext context) =>HomePageProvider(),
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0.95),
        appBar: AppBar(
          backgroundColor:Colors.white.withOpacity(0.95),
            title: ListTile(
              tileColor: Colors.white.withOpacity(0.95),
              contentPadding: const EdgeInsets.all(kPAndMZeroS),
              title: const Text("$kHelloTitleText Madam,"),
              subtitle: const Text(kSubTitleText),
              trailing: GestureDetector(
                onTap: (){
                  ZoomDrawer.of(context)!.toggle();
                },
                  child: const Icon(Iconsax.menu)),
            )
          ),
        body: ListView(
          children: [
            ///Search Box
            const SizedBox(height: kDefaultSize,),
            const SearchContainerWidget(text: kSearchTitleText, iconData: Iconsax.search_favorite,),
            const SizedBox(height: kDefaultSize,),
            /// Product Slider
            Selector<HomePageProvider,List<ProductVO>?>(
              selector: (_ , provider ) =>provider.products,
              builder: (BuildContext context, List<ProductVO>? value, Widget? child) {
                final provider = Provider.of<HomePageProvider>(context);
                return Column(
                  children: [
                    ///promo slider widget
                    PromoSliderWidget(provider: provider),
                    const SizedBox(height: kDefaultSize,),
                    ///SmoothPageIndicatorWidget
                    SmoothPageIndicatorWidget(pageIndex: provider,value: value,),
                    /// Categories
                    const HorizontalTextWidget(title: kTopCategoriesText,trailing: Text(kSeeAllText),),

                    Consumer<HomePageProvider>(
                      builder: (BuildContext context, HomePageProvider value, Widget? child){
                        return SizedBox(height: kPAndM40S,child: ListView.builder(
                          itemBuilder: (_,index){
                            return CategoryWidget(provider: provider,index: index,);
                          },itemCount: provider.categories?.length,scrollDirection: Axis.horizontal,),);
                      }
                    ),
                    const HorizontalTextWidget(title: 'Hot Sales',trailing: Text('See all'),),
                    Consumer<HomePageProvider>(
                      builder: (BuildContext context, HomePageProvider value, Widget? child) {
                        if(value.productsByCategory == null){
                          return const CircularProgressIndicator();
                        }else if(value.productsByCategory !=null && value.productsByCategory!.isNotEmpty){
                          return SizedBox(
                            height: 200,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (_,index){
                                return Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.white,
                                  ),
                                  padding: const EdgeInsets.all(5),
                                  width: 130,
                                  height: 200,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                          decoration:BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: GestureDetector(
                                              onTap:(){
                                                Navigator.of(context).push(MaterialPageRoute(builder: (_)=>DetailPage(id: value.productsByCategory?[index].id ?? 0,)));
                                              },
                                              child:CachedNetworkImage(imageUrl: '${value.productsByCategory?[index].image}',height: 100,width: 150,))),
                                      Flexible(child: Text('${value.productsByCategory?[index].title}',maxLines: 2,)),
                                      const SizedBox(height: 10,),
                                      Row(
                                        children: [
                                          Text('\$ ${value.productsByCategory?[index].price}',style: const TextStyle(
                                              fontWeight: FontWeight.bold
                                          ),),
                                          const Spacer(),
                                          const Icon(Icons.favorite_outline),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },itemCount: value.productsByCategory?.length,),
                          );
                        }else{
                          return const Center(child: Text('No Product Available'),);
                        }
                      },
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

