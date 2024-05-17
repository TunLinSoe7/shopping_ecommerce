import 'package:shop_zila/data/vos/product_vo.dart';

abstract class ProductModel{
  Future<List<ProductVO>?> getAllProduct();
  Future<List<String>?> getAllCategories();
  Future<List<ProductVO>?> getProductByCategory(String categoryName);
  Future<ProductVO?> getProductDetail(int id);
}