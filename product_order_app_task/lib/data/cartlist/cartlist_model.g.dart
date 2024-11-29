// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cartlist_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveCartlistProductAdapter extends TypeAdapter<HiveCartlistProduct> {
  @override
  final int typeId = 1;

  @override
  HiveCartlistProduct read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveCartlistProduct(
      id: fields[0] as int,
      name: fields[1] as String,
      img: fields[3] as String,
      price: fields[2] as String,
      cartQuantity: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, HiveCartlistProduct obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.img)
      ..writeByte(4)
      ..write(obj.cartQuantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveCartlistProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}