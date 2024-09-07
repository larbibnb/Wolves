import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wolves/Features/game/presentation/view_model/cubits/counter_cubite/roles_counter.dart';
import 'package:wolves/Features/home/data/models/player_modele.dart';
import 'package:wolves/Features/game/presentation/views/widgets/player_list_tile_builder.dart';

class PlayersView extends StatefulWidget {
  const PlayersView( {super.key});

  @override
  State<PlayersView> createState() => _PlayersViewState();
}

class _PlayersViewState extends State<PlayersView> {
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
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Players'),
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
            ElevatedButton(
              onPressed: () {
                context.read<RolesCounterCubit>().zeroRole();
                if (players.length > 3) {
                  GoRouter.of(context).push('/roles', extra: players);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: players.length > 3 ? Colors.red : Colors.grey,
                disabledIconColor: Colors.grey,
                fixedSize: const Size(200, 50),
                textStyle: const TextStyle(
                  color: Colors.black,
                ),
              ),
              child: const Icon(Icons.arrow_forward_sharp),
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

/*class ListOfPlayers extends StatelessWidget {
  const ListOfPlayers({
    super.key,
    required this.players,
  });

  final List<PlayerModele> players;

  @override
  Widget build(BuildContext context) {
    return 
          }),
    );
  }
}*/
