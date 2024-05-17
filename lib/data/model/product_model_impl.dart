import 'package:shop_zila/data/model/product_model.dart';
import 'package:shop_zila/data/vos/product_vo.dart';
import 'package:shop_zila/data_agent/product_data_agent.dart';
import 'package:shop_zila/data_agent/product_data_agent_impl.dart';

class ProductModelImpl extends ProductModel{
  ProductModelImpl._();
  static final ProductModelImpl _singleton = ProductModelImpl._();
  factory ProductModelImpl()=>_singleton;

  final ProductDataAgent _productDataAgent = ProductDataAgentImpl();

  @override
  Future<List<ProductVO>?> getAllProduct() =>
      _productDataAgent.getProduct();

  @override
  Future<List<String>?> getAllCategories() =>
      _productDataAgent.getCategories();

  @override
  Future<List<ProductVO>?> getProductByCategory(String categoryName) =>
      _productDataAgent.getProductByCategory(categoryName);

  @override
  Future<ProductVO?> getProductDetail(int id)=>
      _productDataAgent.getProductDetail(id);

}