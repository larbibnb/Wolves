import 'package:flutter/material.dart';
import 'package:wolves/core/shared/models/team_roles.dart';

class RoleCard extends StatelessWidget {
  const RoleCard({super.key, required this.role});
  final TeamRolesModele role;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 200,
      child: Card(
        elevation: 4.0,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: const BorderSide(color: Colors.grey, width: 1.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image(image: AssetImage(role.image)),
        ),
      ),
    );
  }
}
