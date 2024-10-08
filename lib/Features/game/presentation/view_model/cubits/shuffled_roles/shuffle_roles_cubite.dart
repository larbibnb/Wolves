import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wolves/Features/game/presentation/view_model/cubits/shuffled_roles/shuffle_states.dart';
import 'package:wolves/core/shared/models/team_roles.dart';

class ShuffleRolesCubite extends Cubit<InitialState> {
  ShuffleRolesCubite() : super(InitialState());

  List<TeamRolesModele> shuffleRoles(List<TeamRolesModele> roles) {
    final List<TeamRolesModele> shuffledRoles = List.from(roles)..shuffle();

    emit(ShuffledRolesState(shuffledRoles));

    return shuffledRoles;
  }
}
