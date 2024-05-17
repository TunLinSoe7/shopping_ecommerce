import 'package:retrofit/http.dart';
import 'package:shop_zila/utils/constants/api_constant.dart';
import '../../data/vos/product_vo.dart';
import 'package:dio/dio.dart';
part 'product_api.g.dart';

@RestApi(baseUrl: kBaseUrl)
abstract class ProductApi{
 factory ProductApi(Dio dio){
  return _ProductApi(dio);
 }
  ///get product response
 @GET(kProductEndPoints)
  Future<List<ProductVO>> getProductVO();

 ///get category response
 @GET(kCategoriesEndPoints)
 Future<List<String>> getCategoryVO();

 ///get product by category
 @GET(kProductByCategoryEndPoint)
 Future<List<ProductVO>> getProductByCategory(
     @Path('categoryName') String categoryName
     );
 ///get product detail
 @GET(kProductDetailEndPoint)
 Future<ProductVO?> getProductDetail(
     @Path(kPathParamsProductDetailID) int id,
     );
}