import 'package:shop_zila/data/vos/product_vo.dart';

abstract class ProductDataAgent{
   Future<List<ProductVO>?> getProduct();
   Future<List<String>?> getCategories();
   Future<List<ProductVO>?> getProductByCategory(String categoryName);
   Future<ProductVO?> getProductDetail(int id);
}