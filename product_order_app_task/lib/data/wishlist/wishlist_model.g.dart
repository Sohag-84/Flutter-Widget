// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishlist_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveWishlistProductAdapter extends TypeAdapter<HiveWishlistProduct> {
  @override
  final int typeId = 0;

  @override
  HiveWishlistProduct read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveWishlistProduct(
      id: fields[0] as int,
      name: fields[1] as String,
      img: fields[3] as String,
      price: fields[2] as String,
      cartQuantity: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, HiveWishlistProduct obj) {
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
      other is HiveWishlistProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
