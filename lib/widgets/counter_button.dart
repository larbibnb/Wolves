import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wolves/cubits/counter_cubite/counter_cubite.dart';
import 'package:wolves/cubits/counter_cubite/roles_counter.dart';
import 'package:wolves/models/team_roles.dart';

class CounterButton extends StatefulWidget {
  const CounterButton({
    super.key,
    required this.numPlayers,
    required this.Croles,
  });
  final TeamRolesModele Croles;
  final int numPlayers;

  @override
  State<CounterButton> createState() => _CounterButtonState();
}

class _CounterButtonState extends State<CounterButton> {
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
                    if ((widget.Croles.roleName == 'wolf' ||
                            widget.Croles.roleName == 'villager') &&
                        (state < 2)) {
                    } else {
                      context.read<CounterCubit>().decrement();
                      context
                          .read<RolesCounterCubit>()
                          .removeRole(widget.Croles);
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
                    if (widget.Croles.roleName == 'wolf' &&
                        totalroles < widget.numPlayers) {
                      context.read<RolesCounterCubit>().isWolf = true;
                    }

                    if (totalroles < widget.numPlayers) {
                      context.read<CounterCubit>().increment();
                      context.read<RolesCounterCubit>().addRole(widget.Croles);
                    }
                  }),
            ),
          ],
        );
      }),
    );
  }
}
