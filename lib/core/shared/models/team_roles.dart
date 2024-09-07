import 'package:hive/hive.dart';
part 'team_roles.g.dart';
@HiveType(typeId: 0)
class TeamRolesModele extends HiveObject {
  @HiveField(0)
  final String roleName;
  @HiveField(1)
  final String category;
  @HiveField(2)
  final String image;
  TeamRolesModele(
      {required this.category, required this.roleName, required this.image});
}
