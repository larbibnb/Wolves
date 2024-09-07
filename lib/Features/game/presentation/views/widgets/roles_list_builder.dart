import 'package:flutter/material.dart';
import 'package:wolves/core/shared/models/team_roles.dart';
import 'package:wolves/Features/game/presentation/views/widgets/role_tile.dart';

class RolesListBuillder extends StatelessWidget {
  RolesListBuillder({super.key, required this.numPlayers});
  final int numPlayers;
  final List<TeamRolesModele> rolesList = [
    TeamRolesModele(
        roleName: 'wolf', image: 'assets/images/wolf.png', category: 'wolves'),
    TeamRolesModele(
        roleName: 'alphawolf',
        image: 'assets/images/alphawolf.jpg',
        category: 'wolves'),
    TeamRolesModele(
        roleName: 'wolffan',
        image: 'assets/images/wolffan.png',
        category: 'wolves'),
    TeamRolesModele(
        roleName: 'villager',
        image: 'assets/images/villager.png',
        category: 'villagers'),
    TeamRolesModele(
        roleName: 'doctor',
        image: 'assets/images/doctor.jpg',
        category: 'villagers'),
    TeamRolesModele(
        roleName: 'witch',
        image: 'assets/images/witch.png',
        category: 'villagers'),
    TeamRolesModele(
        roleName: 'gunner',
        image: 'assets/images/gunner.png',
        category: 'villagers'),
    TeamRolesModele(
        roleName: 'priest',
        image: 'assets/images/priest.jpg',
        category: 'villagers'),
    TeamRolesModele(
        roleName: 'seer',
        image: 'assets/images/seer.png',
        category: 'villagers'),
    TeamRolesModele(
        roleName: 'seer',
        image: 'assets/images/seer.png',
        category: 'villagers'),
    TeamRolesModele(
        roleName: 'seer',
        image: 'assets/images/seer.png',
        category: 'villagers'),
    TeamRolesModele(
        roleName: 'seer',
        image: 'assets/images/seer.png',
        category: 'villagers'),
  ];

  @override
  Widget build(BuildContext context) {
    return RolesList(rolesList: rolesList, numPlayers: numPlayers);
  }
}

class RolesList extends StatelessWidget {
  const RolesList({
    super.key,
    required this.rolesList,
    required this.numPlayers,
  });

  final List<TeamRolesModele> rolesList;
  final int numPlayers;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: rolesList.length,
      itemBuilder: (context, index) {
        TeamRolesModele roles = rolesList[index];
        return RoleTile(roles: roles, numPlayers: numPlayers);
      },
    );
  }
}
