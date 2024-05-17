// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RatingVO _$RatingVOFromJson(Map<String, dynamic> json) => RatingVO(
      rate: (json['rate'] as num?)?.toDouble(),
      count: (json['count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$RatingVOToJson(RatingVO instance) => <String, dynamic>{
      'rate': instance.rate,
      'count': instance.count,
    };
