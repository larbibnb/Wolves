import 'package:go_router/go_router.dart';

import '../../Features/decisionMade/presentation/views/waiting_room_view.dart';
import '../../Features/game/presentation/views/game_view.dart';
import '../../Features/game/presentation/views/roles_view.dart';
import '../../Features/home/presentation/views/my_home_view.dart';
import '../../Features/home/presentation/views/player_depot_view.dart';
import '../../Features/home/presentation/views/players_view.dart';

GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) => const MyHomeView(),
    ),
    GoRoute(
      path: '/game',
      builder: (context, state) => const GameView(),
    ),
    GoRoute(
      path: '/roles',
      builder: (context, state) => const RolesView(),
    ),
    GoRoute(
      path: '/players',
      builder: (context, state) => const PlayersView(),
    ),
    GoRoute(
      path: 'waiting',
      builder: (context, state) => const WaitingRoomView(),
    ),
    GoRoute(
      path: '/playerDepot',
      builder: (context, state) => const PlayersDepotView(),
    ),
  ],
);
