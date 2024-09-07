import 'package:go_router/go_router.dart';
import 'package:wolves/Features/customized_roles/presentation/views/customized.dart';
import 'package:wolves/Features/home/data/models/player_modele.dart';
import 'package:wolves/core/shared/models/team_roles.dart';

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
      name: 'game',
      path: '/game',
      builder: (context, state) {
        
         final extra = state.extra as Map<String, dynamic>;
         List<PlayerModele> playersList= extra['playersList'];
         List<TeamRolesModele> shuffledRoles= extra ['shuffledRoles'];
        
         return GameView(
        playersList: playersList,
        shuffledRoles: shuffledRoles,
      );}
    ),
    GoRoute(
      path: '/roles',
      builder: (context, state) => RolesView(
        playersList: state.extra as List<PlayerModele>,
      ),
    ),
    GoRoute(
      path: '/players',
      builder: (context, state) => const PlayersView(),
    ),
    GoRoute(
      path: '/waiting',
      builder: (context, state) => const WaitingRoomView(),
    ),
    GoRoute(
      path: '/playersDepot',
      builder: (context, state) => const PlayersDepotView(),
    ),
    GoRoute(
      path: '/customized',
      builder: (context, state) => const Customized(),
    ),
  ],
);
