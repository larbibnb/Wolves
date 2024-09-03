// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_roles.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TeamRolesModeleAdapter extends TypeAdapter<TeamRolesModele> {
  @override
  final int typeId = 0;

  @override
  TeamRolesModele read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TeamRolesModele(
      category: fields[1] as String,
      roleName: fields[0] as String,
      image: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TeamRolesModele obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.roleName)
      ..writeByte(1)
      ..write(obj.category)
      ..writeByte(2)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TeamRolesModeleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
