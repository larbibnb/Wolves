import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:wolves/Features/game/presentation/view_model/cubits/counter_cubite/counter_cubite.dart';
import 'package:wolves/Features/game/presentation/view_model/cubits/counter_cubite/roles_counter.dart';
import 'package:wolves/Features/game/presentation/view_model/cubits/shuffled_roles/shuffle_roles_cubite.dart';

import 'package:wolves/constants.dart';
import 'package:wolves/core/utils/app_routes.dart';

import 'core/shared/models/team_roles.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(kRolesBox);
  Hive.registerAdapter(TeamRolesModeleAdapter());
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
