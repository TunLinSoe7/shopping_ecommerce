import 'package:dio/dio.dart';
import 'package:shop_zila/data_agent/product_data_agent.dart';
import 'package:shop_zila/network/api/product_api.dart';
import 'package:shop_zila/data/vos/product_vo.dart';


class ProductDataAgentImpl extends ProductDataAgent {
  late ProductApi _productApi;
  ProductDataAgentImpl._(){
    _productApi = ProductApi(Dio());
  }
  static final ProductDataAgentImpl _singleton = ProductDataAgentImpl._();
  factory ProductDataAgentImpl()=>_singleton;

  @override
  Future<List<ProductVO>?> getProduct() =>
      _productApi.getProductVO();
/// get categories
  @override
  Future<List<String>?> getCategories() =>
      _productApi.getCategoryVO();
/// get product by category
  @override
  Future<List<ProductVO>?> getProductByCategory(String categoryName) =>
      _productApi.getProductByCategory(categoryName);

  @override
  Future<ProductVO?> getProductDetail(int id) =>
      _productApi.getProductDetail(id);
}