import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:wolves/Features/game/presentation/view_model/cubits/counter_cubite/counter_cubite.dart';
import 'package:wolves/Features/game/presentation/view_model/cubits/counter_cubite/roles_counter.dart';
import 'package:wolves/Features/game/presentation/view_model/cubits/counter_cubite/shuffle_roles_cubite.dart';
import 'package:wolves/Features/home/presentation/views/my_home_view.dart';
import 'package:wolves/Features/game/presentation/views/game_view.dart';
import 'package:wolves/Features/home/presentation/views/player_depot_view.dart';
import 'package:wolves/Features/home/presentation/views/players_view.dart';
import 'package:wolves/Features/game/presentation/views/roles_view.dart';
import 'package:wolves/Features/decisionMade/presentation/views/waiting_room_view.dart';
import 'package:wolves/constants.dart';
import 'package:wolves/core/utils/app_routes.dart';

void main() async{
  Hive.initFlutter();
  await Hive.openBox(kPlayersBox);
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
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'wolves',
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
        ),
        routerConfig: router,
      ),
    );
  }
}
