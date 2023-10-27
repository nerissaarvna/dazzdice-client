import 'package:dice_client/home.dart';
import 'package:flutter/material.dart';
import 'package:dice_client/start.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: '/',
      builder: (context, state) => const StartPage(),
    ),
    GoRoute(
      path: '/lobby/:id',
      name: 'lobby',
      builder: (context, state) => LobbyPage(id: state.pathParameters['id']!),
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
    return ScreenUtilInit(
      designSize: const Size(1080, 1920),
      minTextAdapt: true,
      builder: (_, child) {
        return MaterialApp.router(
          routerConfig: _router,
          theme: ThemeData(
            useMaterial3: true,
          ),
        );
      },
    );
  }
}
