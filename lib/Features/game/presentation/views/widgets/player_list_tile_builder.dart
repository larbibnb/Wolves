import 'package:flutter/material.dart';
import 'package:wolves/Features/home/data/models/player_modele.dart';

class PlayerListTileBuilder extends StatelessWidget {
  const PlayerListTileBuilder(
      {super.key, required this.players, required this.onRemove});
  final List<PlayerModele> players;
  final Function onRemove;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: players.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 16.0, right: 8.0),
          child: ListTile(
            title: Text(players[index].name),
            trailing: IconButton(
              onPressed: () => onRemove(index),
              icon: const Icon(Icons.delete),
            ),
            tileColor: const Color.fromARGB(255, 193, 232, 241),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        );
      },
    );
  }
}

          
/*[ Text(players[index].name, style: TextStyle(color: Colors.black)),
              Spacer(
                flex: 1,
              ),
              IconButton(
                onPressed: () => onRemove(index),
                icon: Icon(Icons.delete),
              ),
            ],*/