import 'package:json_annotation/json_annotation.dart';

import 'rating_vo.dart';
part 'product_vo.g.dart';
@JsonSerializable()
class ProductVO {
  @JsonKey(name:'id')
  int? id;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'price')
  double? price;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'category')
  String? category;
  @JsonKey(name: 'image')
  String? image;
  @JsonKey(name: 'rating')
  RatingVO? rating;

  ProductVO(
      {this.id,
        this.title,
        this.price,
        this.description,
        this.category,
        this.image,
        this.rating});

  factory ProductVO.fromJson(Map<String, dynamic> json) =>_$ProductVOFromJson(json);

  Map<String, dynamic> toJson() =>_$ProductVOToJson(this);
}