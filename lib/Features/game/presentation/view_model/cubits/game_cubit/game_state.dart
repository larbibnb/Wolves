part of 'game_cubit.dart';


class GameState {
   final int pressCount;
  final int currentContentIndex;
  final bool isBlurred;

  const GameState({this.pressCount = 0, this.currentContentIndex = 0, this.isBlurred = false});

  GameState copyWith({
    int? pressCount,
    int? currentContentIndex,
    bool? isBlurred,
  }) {
    return GameState(
      pressCount: pressCount ?? this.pressCount,
      currentContentIndex: currentContentIndex ?? this.currentContentIndex,
      isBlurred: isBlurred ?? this.isBlurred,
    );
  }
}

