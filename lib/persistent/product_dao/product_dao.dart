import '../../data/vos/product_vo.dart';

abstract class ProductDAO{
  void save(List<ProductVO> productList);
  List<ProductVO>? getProductByCategoryFromDatabase(String categoryName);
  List<ProductVO>? getAllProductFromDatabase();
  Stream watchProductBox();
  Stream<List<ProductVO>?> getProductByCategoryFromDatabaseStream(String categoryName);
  Stream<List<ProductVO>?> getAllProductFromDatabaseStream();
}