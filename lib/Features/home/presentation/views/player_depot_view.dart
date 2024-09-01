import 'package:flutter/material.dart';
import 'package:wolves/Features/home/data/models/player_modele.dart';
import 'package:wolves/Features/game/presentation/views/widgets/player_list_tile_builder.dart';

class PlayersDepotView extends StatefulWidget {
  const PlayersDepotView({super.key});

  @override
  State<PlayersDepotView> createState() => _PlayersDepotViewState();
}

class _PlayersDepotViewState extends State<PlayersDepotView> {
  List<PlayerModele> players = [];
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  _onsubmit() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        players.add(PlayerModele(name: _controller.text));
      });
      _controller.clear();
    }
  }

  _ondelete(int index) {
    setState(() {
      players.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Players Depot'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            customTextField(),
            Expanded(
              child:
                  PlayerListTileBuilder(players: players, onRemove: _ondelete),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  Row customTextField() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            onSubmitted: (value) {
              _onsubmit();
              _focusNode.requestFocus();
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                labelText: 'Player Name',
                hintText: 'Enter Player Name'),
          ),
        ),
        IconButton(
            onPressed: () {
              _onsubmit();
            },
            icon: const Icon(Icons.add)),
        const SizedBox(
          height: 32,
        ),
      ],
    );
  }
}
