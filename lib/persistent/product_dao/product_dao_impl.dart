import 'package:hive/hive.dart';
import 'package:shop_zila/data/vos/product_vo.dart';
import 'package:shop_zila/persistent/product_dao/product_dao.dart';
import 'package:shop_zila/utils/constants/hive_constant.dart';

class ProductDAOImpl extends ProductDAO {
  ProductDAOImpl._();
  static final ProductDAOImpl _singleton = ProductDAOImpl._();
  factory ProductDAOImpl() => _singleton;


  @override
  Stream watchProductBox() => _productBox().watch();
  @override
  List<ProductVO>? getProductByCategoryFromDatabase(String categoryName) =>
      _productBox().values.where((product) => product.category == categoryName).toList();

  @override
  void save(List<ProductVO> productList) {
    for (var product in productList) {
      _productBox().put(product.id, product);
    }
  }

  @override
  Stream<List<ProductVO>?> getProductByCategoryFromDatabaseStream(String categoryName) =>
      Stream.value(getProductByCategoryFromDatabase(categoryName));

  @override
  List<ProductVO>? getAllProductFromDatabase() =>_productBox().values.toList();

  @override
  Stream<List<ProductVO>?> getAllProductFromDatabaseStream()=>Stream.value(getAllProductFromDatabase());
  Box<ProductVO> _productBox() => Hive.box<ProductVO>(kBoxNameForProductVO);

}

