import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wolves/core/shared/models/team_roles.dart';

class RolesCounterCubit extends Cubit<int> {
  RolesCounterCubit() : super(0);
  bool isWolf = false;
  List<TeamRolesModele> selectedRoles = [];

  void addRole(TeamRolesModele role) {
    selectedRoles.add(role);
    emit(state + 1);
  }

  void removeRole(TeamRolesModele role) {
    selectedRoles.remove(role);
    emit(state - 1);
  }

  void zeroRole() {
    emit(state - state);
  }

  List<TeamRolesModele> getRoles() {
    return selectedRoles;
  }
}
