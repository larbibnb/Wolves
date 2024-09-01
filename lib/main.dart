import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wolves/Features/game/presentation/view_model/cubits/counter_cubite/counter_cubite.dart';
import 'package:wolves/Features/game/presentation/view_model/cubits/counter_cubite/roles_counter.dart';
import 'package:wolves/Features/game/presentation/view_model/cubits/counter_cubite/shuffle_roles_cubite.dart';
import 'package:wolves/Features/home/presentation/views/my_home_view.dart';
import 'package:wolves/Features/game/presentation/views/game_view.dart';
import 'package:wolves/Features/home/presentation/views/players_view.dart';
import 'package:wolves/Features/game/presentation/views/roles_view.dart';
import 'package:wolves/Features/decisionMade/presentation/views/waiting_room_view.dart';

void main() {
  runApp(const Wolves());
}

class Wolves extends StatelessWidget {
  const Wolves({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterCubit(),
        ),
        BlocProvider(
          create: (context) => ShuffleRolesCubite(),
        ),
        BlocProvider(
          create: (context) => RolesCounterCubit(),
        )
      ],
      child: MaterialApp(
        title: 'wolves',
        debugShowCheckedModeBanner: false,
        routes: {
          '/home': (context) => const MyHomeView(),
          '/players': (context) => const PlayersView(),
          '/roles': (context) => const RolesView(),
          '/game': (context) => const GameView(),
          '/waiting': (context) => const WaitingRoomView(),
        },
        home: const MyHomeView(),
      ),
    );
  }
}
