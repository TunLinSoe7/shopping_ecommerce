// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RatingVOAdapter extends TypeAdapter<RatingVO> {
  @override
  final int typeId = 2;

  @override
  RatingVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RatingVO(
      rate: fields[0] as double?,
      count: fields[1] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, RatingVO obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.rate)
      ..writeByte(1)
      ..write(obj.count);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RatingVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
