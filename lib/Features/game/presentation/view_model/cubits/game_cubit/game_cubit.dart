import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wolves/Features/home/data/models/player_modele.dart';
import 'package:wolves/core/shared/models/team_roles.dart';
part 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  final List<TeamRolesModele> shuffledRoles;
  final List<PlayerModele> playersList;
  GameCubit({required this.shuffledRoles, required this.playersList})
      : super(const GameState());

  void nextContent() {
    if (state.currentContentIndex < shuffledRoles.length - 1) {
      emit(state.copyWith(currentContentIndex: state.currentContentIndex + 1));
    }
  }

  void incrementCounter() {
    emit(state.copyWith(pressCount: state.pressCount + 1));
  }

  void toggleBlur() {
    emit(state.copyWith(isBlurred: !state.isBlurred));
  }
}
