import 'package:wolves/models/team_roles.dart';

class InitialState {}

class ShuffledRolesState extends InitialState {
  final List<TeamRolesModele> shuffledRoles;
  ShuffledRolesState(this.shuffledRoles);
}
