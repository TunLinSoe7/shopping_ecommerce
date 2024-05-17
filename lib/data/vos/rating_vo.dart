import 'package:json_annotation/json_annotation.dart';
part 'rating_vo.g.dart';
@JsonSerializable()
class RatingVO {
  @JsonKey(name: 'rate')
  double? rate;
  @JsonKey(name: 'count')
  int? count;

  RatingVO({this.rate, this.count});

  factory RatingVO.fromJson(Map<String, dynamic> json) =>_$RatingVOFromJson(json);

  Map<String, dynamic> toJson() =>_$RatingVOToJson(this);
}