import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wolves/Features/game/presentation/view_model/cubits/counter_cubite/counter_cubite.dart';
import 'package:wolves/Features/game/presentation/view_model/cubits/counter_cubite/roles_counter.dart';
import 'package:wolves/Features/home/data/models/team_roles.dart';

class CounterButton extends StatelessWidget {
  const CounterButton({
    super.key,
    required this.numPlayers,
    required this.croles,
  });
  final TeamRolesModele croles;
  final int numPlayers;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: BlocBuilder<CounterCubit, int>(builder: (context, state) {
        return Row(
          children: [
            SizedBox(
              height: 32,
              width: 32,
              child: FloatingActionButton(
                  heroTag: null,
                  child: const Icon(Icons.remove),
                  onPressed: () {
                    if ((croles.roleName == 'wolf' ||
                            croles.roleName == 'villager') &&
                        (state < 2)) {
                    } else {
                      context.read<CounterCubit>().decrement();
                      context.read<RolesCounterCubit>().removeRole(croles);
                    }
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0, left: 8.0),
              child: Text('$state', style: textTheme.headlineSmall),
            ),
            SizedBox(
              height: 32,
              width: 32,
              child: FloatingActionButton(
                  heroTag: null,
                  child: const Icon(Icons.add),
                  onPressed: () {
                    final totalroles = context.read<RolesCounterCubit>().state;
                    if (croles.roleName == 'wolf' && totalroles < numPlayers) {
                      context.read<RolesCounterCubit>().isWolf = true;
                    }

                    if (totalroles < numPlayers) {
                      context.read<CounterCubit>().increment();
                      context.read<RolesCounterCubit>().addRole(croles);
                    }
                  }),
            ),
          ],
        );
      }),
    );
  }
}
