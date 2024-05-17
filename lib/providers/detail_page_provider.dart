import 'package:flutter/foundation.dart';
import 'package:shop_zila/data/model/product_model_impl.dart';
import 'package:shop_zila/data/vos/product_vo.dart';

import '../data/model/product_model.dart';

class DetailPageProvider extends ChangeNotifier{
  final ProductModel _productModel = ProductModelImpl();
  ProductVO? _productVO;
  bool _isLoading = true;
  bool get loadingStatus =>_isLoading;
  ProductVO? get productDetail =>_productVO;
  DetailPageProvider(int id){
    _productModel.getProductDetail(id).then((value) {
        _productVO = value;
        notifyListeners();
    });
  }
}