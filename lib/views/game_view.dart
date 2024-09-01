import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wolves/cubits/counter_cubite/shuffle_roles_cubite.dart';
import 'package:wolves/cubits/counter_cubite/shuffle_states.dart';
import 'package:wolves/models/player_modele.dart';
import 'package:wolves/models/team_roles.dart';
import 'package:wolves/widgets/role_card.dart';

class GameView extends StatefulWidget {
  const GameView({super.key});

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
        final args = ModalRoute.of(context)!.settings.arguments as Map;
        final shuffledRolesList =
            args['shuffledRoles'] as List<TeamRolesModele>;
        final playersList = args['playersList'] as List<PlayerModele>;
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
                      playersList[_currentContentIndex].name,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Stack(children: [
                    RoleCard(
                      role: shuffledRolesList[_currentContentIndex],
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
                              shuffledRolesList.length - 1) {
                            _nextContent();
                          } else if (_currentContentIndex ==
                              shuffledRolesList.length - 1) {
                            Navigator.pushNamed(context, '/waiting');
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
