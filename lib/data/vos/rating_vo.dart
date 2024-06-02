import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shop_zila/utils/constants/hive_constant.dart';
part 'rating_vo.g.dart';
@JsonSerializable()
@HiveType(typeId: kHiveTypeForRatingVO)
class RatingVO {
  @JsonKey(name: 'rate')
  @HiveField(0)
  double? rate;
  @JsonKey(name: 'count')
  @HiveField(1)
  int? count;

  RatingVO({this.rate, this.count});

  factory RatingVO.fromJson(Map<String, dynamic> json) =>_$RatingVOFromJson(json);

  Map<String, dynamic> toJson() =>_$RatingVOToJson(this);
}