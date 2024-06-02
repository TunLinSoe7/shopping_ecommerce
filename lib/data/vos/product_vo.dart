import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shop_zila/utils/constants/hive_constant.dart';
import 'rating_vo.dart';
part 'product_vo.g.dart';
@JsonSerializable()
@HiveType(typeId: kHiveTypeForProductVO)
class ProductVO {
  @JsonKey(name:'id')
  @HiveField(0)
  int? id;
  @JsonKey(name: 'title')
  @HiveField(1)
  String? title;
  @JsonKey(name: 'price')
  @HiveField(2)
  double? price;
  @JsonKey(name: 'description')
  @HiveField(3)
  String? description;
  @JsonKey(name: 'category')
  @HiveField(4)
  String? category;
  @JsonKey(name: 'image')
  @HiveField(5)
  String? image;
  @JsonKey(name: 'rating')
  @HiveField(6)
  RatingVO? rating;
  @HiveField(7)
  bool? isSliderProduct;

  ProductVO(
      {this.id,
        this.title,
        this.price,
        this.description,
        this.category,
        this.image,
        this.rating,
        this.isSliderProduct = false
      });

  factory ProductVO.fromJson(Map<String, dynamic> json) =>_$ProductVOFromJson(json);

  Map<String, dynamic> toJson() =>_$ProductVOToJson(this);
}