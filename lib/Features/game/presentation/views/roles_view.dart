import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wolves/Features/game/presentation/view_model/cubits/counter_cubite/roles_counter.dart';
import 'package:wolves/Features/game/presentation/view_model/cubits/counter_cubite/shuffle_roles_cubite.dart';
import 'package:wolves/Features/home/data/models/player_modele.dart';
import 'package:wolves/Features/game/presentation/views/widgets/roles_list_builder.dart';

class RolesView extends StatelessWidget {
  const RolesView({super.key});

  @override
  Widget build(BuildContext context) {
    final playersList =
        ModalRoute.of(context)!.settings.arguments as List<PlayerModele>;
    return Builder(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Roles'),
        ),
        body: Column(children: [
          Expanded(child: RolesListBuillder(numPlayers: playersList.length)),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                if (context.read<RolesCounterCubit>().isWolf == true &&
                    context.read<RolesCounterCubit>().state ==
                        playersList.length) {
                  final selectedRoles =
                      context.read<RolesCounterCubit>().getRoles();
                  final shuffledRoles = context
                      .read<ShuffleRolesCubite>()
                      .shuffleRoles(selectedRoles);

                  Navigator.pushNamed(context, '/game', arguments: {
                    'shuffledRoles': shuffledRoles,
                    'playersList': playersList
                  });
                }
              },
              style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.resolveWith<Color>(
                    (Set<WidgetState> states) {
                      if (states.contains(WidgetState.disabled)) {
                        return Colors.grey;
                      }
                      return Colors.red;
                    },
                  ),
                  fixedSize: WidgetStateProperty.all(const Size(200, 50))),
              child: const Text(
                "start game",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ]),
      );
    });
  }
}
