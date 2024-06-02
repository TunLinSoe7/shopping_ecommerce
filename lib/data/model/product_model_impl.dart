import 'package:shop_zila/data/model/product_model.dart';
import 'package:shop_zila/data/vos/product_vo.dart';
import 'package:shop_zila/data_agent/product_data_agent.dart';
import 'package:shop_zila/data_agent/product_data_agent_impl.dart';
import 'package:shop_zila/persistent/product_dao/product_dao.dart';
import 'package:shop_zila/persistent/product_dao/product_dao_impl.dart';
import "package:stream_transform/stream_transform.dart";

class ProductModelImpl extends ProductModel{
  ProductModelImpl._();
  static final ProductModelImpl _singleton = ProductModelImpl._();
  factory ProductModelImpl()=>_singleton;

  final ProductDataAgent _productDataAgent = ProductDataAgentImpl();
  final ProductDAO _productDAO = ProductDAOImpl();

  @override
  Future<List<ProductVO>?> getAllProduct() =>
      _productDataAgent.getProduct().then((value) {
        if(value!=null){
          _productDAO.save(value);
        }
        return value;
      });

  @override
  Future<List<String>?> getAllCategories() =>
      _productDataAgent.getCategories();

  @override
  Future<List<ProductVO>?> getProductByCategory(String categoryName) =>
      _productDataAgent.getProductByCategory(categoryName).then((value){
        if(value!=null){
          _productDAO.save(value);
        }
        return value;
      });

  @override
  Future<ProductVO?> getProductDetail(int id)=>
      _productDataAgent.getProductDetail(id);

  @override
  Stream<List<ProductVO>?> getProductVOFromDatabase(String categoryName) =>_productDAO.watchProductBox()
      .startWith(_productDAO.getProductByCategoryFromDatabaseStream(categoryName))
      .map((event) => _productDAO.getProductByCategoryFromDatabase(categoryName));

  @override
  Stream<List<ProductVO>?> getAllProductFromDatabase() =>_productDAO.watchProductBox()
      .startWith(_productDAO.getAllProductFromDatabaseStream())
      .map((event) => _productDAO.getAllProductFromDatabase());
}