import 'package:dice_client/pages/arena.dart';
import 'package:dice_client/pages/lobby.dart';
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
      path: '/arena',
      name: 'arena',
      builder: (context, state) => const ArenaPage(),
    ),
  ],
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
              create: (context) => LobbyConnProvider(),
              lazy: true,
            ),
            ChangeNotifierProvider(
              create: (context) => MatchProvider(),
              lazy: true,
            ),
            ChangeNotifierProvider(
              create: (context) => LobbyHistoryProvider(),
              lazy: true,
            ),
          ],
          child: MaterialApp.router(
            routerConfig: _router,
            theme: ThemeData(
              useMaterial3: true,
            ),
          ),
        );
      },
    );
  }
}
