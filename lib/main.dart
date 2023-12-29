import 'package:dice_client/pages/single_player.dart';
import 'package:dice_client/pages/lobby.dart';
import 'package:dice_client/pages/vs_player.dart';
import 'package:flutter/material.dart';
import 'package:dice_client/pages/start.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:dice_client/providers.dart';
import 'package:flutter/services.dart';

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: '/',
      builder: (context, state) => const StartPage(),
    ),
    GoRoute(
      path: '/lobby',
      name: 'lobby',
      builder: (context, state) => const LobbyPage(),
    ),
    GoRoute(
      path: '/singleplayer',
      name: 'singleplayer',
      builder: (context, state) => const SinglePlayerPage(),
    ),
    GoRoute(
      path: '/vsplayer',
      name: 'vsplayer',
      builder: (context, state) => const VsPlayerPage(),
    ),
  ],
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return ScreenUtilInit(
      designSize: const Size(1080, 1920),
      minTextAdapt: true,
      builder: (_, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => UserProvider()),
            ChangeNotifierProvider(
              create: (context) => LobbyUserProvider(),
              lazy: true,
            ),
            ChangeNotifierProvider(
              create: (context) => MatchProvider(),
              lazy: true,
            ),
            ChangeNotifierProvider(
              create: (context) => LobbyMatchProvider(),
              lazy: true,
            ),
            ChangeNotifierProvider(
              create: (context) => LobbyChallengeProvider(),
              lazy: true,
            ),
            ChangeNotifierProvider(
              create: (context) => ChallengeProvider(),
              lazy: true,
            ),
          ],
          child: MaterialApp.router(
            title: "DazzDice",
            routerConfig: _router,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: true,
            ),
          ),
        );
      },
    );
  }
}
