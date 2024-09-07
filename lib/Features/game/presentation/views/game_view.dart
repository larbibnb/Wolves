import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wolves/Features/game/presentation/view_model/cubits/shuffled_roles/shuffle_roles_cubite.dart';
import 'package:wolves/Features/game/presentation/view_model/cubits/shuffled_roles/shuffle_states.dart';
import 'package:wolves/Features/home/data/models/player_modele.dart';
import 'package:wolves/core/shared/models/team_roles.dart';
import 'package:wolves/Features/game/presentation/views/widgets/role_card.dart';

class GameView extends StatefulWidget {
  const GameView(
      {super.key, required this.shuffledRoles, required this.playersList});
  final List<TeamRolesModele> shuffledRoles;
  final List<PlayerModele> playersList;
  @override
  State<GameView> createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  int _pressCount = 0;
  int _currentContentIndex = 0;

  void _incrementCounter() {
    setState(() {
      _pressCount++;
    });
  }

  bool _isBlurred = true;
  void _toggleBlur() {
    setState(() {
      _isBlurred = !_isBlurred;
    });
  }

  void _nextContent() {
    setState(() {
      _currentContentIndex = (_currentContentIndex + 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShuffleRolesCubite, InitialState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('play'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      widget.playersList[_currentContentIndex].name,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Stack(children: [
                    RoleCard(
                      role: widget.shuffledRoles[_currentContentIndex],
                    ),
                    ClipRect(
                      child: BackdropFilter(
                        filter: _isBlurred
                            ? ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0)
                            : ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
                        child: Container(
                          height: 200,
                          width: 200,
                          color: Colors.grey.shade200.withOpacity(0.5),
                        ),
                      ),
                    )
                  ]),
                  const Spacer(
                    flex: 1,
                  ),
                  FloatingActionButton(
                      onPressed: () {
                        _incrementCounter();
                        if (_pressCount == 1) {
                          _toggleBlur();
                        }
                        if (_pressCount == 2) {
                          _pressCount = 0;
                          _toggleBlur();
                          if (_currentContentIndex <
                              widget.shuffledRoles.length - 1) {
                            _nextContent();
                          } else if (_currentContentIndex ==
                              widget.shuffledRoles.length - 1) {
                            GoRouter.of(context).push('/waiting');
                          }
                        }
                      },
                      child: const Icon(Icons.arrow_forward_sharp))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
