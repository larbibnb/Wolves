import 'package:flutter/material.dart';
import 'package:wolves/models/team_roles.dart';
import 'package:wolves/widgets/counter_button.dart';

class RoleTile extends StatelessWidget {
  const RoleTile({
    super.key,
    required this.roles,
    required this.numPlayers,
  });
  final TeamRolesModele roles;
  final int numPlayers;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 16),
          height: 80,
          width: 80,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(90),
            child: Image.asset(roles.image),
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        Text(
          roles.roleName,
          style: const TextStyle(fontSize: 18),
        ),
        const Spacer(
          flex: 1,
        ),
        CounterButton(
          numPlayers: numPlayers,
          Croles: roles,
        ),
        const SizedBox(width: 12),
      ],
    );
  }
}
