import 'package:flutter/foundation.dart';

import '../data/model/product_model.dart';
import '../data/model/product_model_impl.dart';
import '../data/vos/product_vo.dart';

class HomePageProvider extends ChangeNotifier {
  List<ProductVO>? _products = [];
  List<ProductVO>? _productByCategory;
  List<String>? _categories;

  final ProductModel _productModel = ProductModelImpl();
  int _sliderCurrentIndex = 0;
  int _categoryCurrentIndex = 0;
  bool isLoading = true;

  List<ProductVO>? get products => _products;
  List<ProductVO>? get productsByCategory => _productByCategory;
  List<String>? get categories => _categories;
  int get getSliderCurrentIndex => _sliderCurrentIndex;
  int get getCategoryCurrentIndex => _categoryCurrentIndex;

  void setSliderCurrentIndex(int index) {
    _sliderCurrentIndex = index;
    notifyListeners();
  }

  void setCategoryIndex(int index) async{
    _categoryCurrentIndex = index;
    fetchAllCategory();
    notifyListeners();
  }

  HomePageProvider() {
    _productModel.getAllProduct().then((value) {
      _products = value?.take(5).toList();
      notifyListeners();
    });
    fetchAllCategory();
  }

  Future<void> fetchProductByCategory(String categoryName)async{
    isLoading = true;
    notifyListeners();
    try {
      await _productModel.getProductByCategory(categoryName).then((value) {
            _productByCategory = value;
          });
    } catch (e) {
      print(e);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchAllCategory() async {
    try {
      final categories = await _productModel.getAllCategories();
      _categories = categories;
      fetchProductByCategory(categories?[_categoryCurrentIndex] ?? 'jewelery');
    } catch (e) {
      print('Error fetching categories: $e');
    }
    notifyListeners();

  }
}
