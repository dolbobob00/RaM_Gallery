import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:voice_assistant/presentation/screens/home_page/home.dart';
import 'package:voice_assistant/presentation/screens/favorites/favorites_page.dart';
import 'package:voice_assistant/presentation/screens/navigation/navigation_wrapper.dart';

abstract class Routes {
  static final routerConfig = GoRouter(
    routes: [
      ShellRoute(
        builder: (context, state, child) => NavigationWrapper(
          location: state.uri.toString(),
          child: child,
        ),
        routes: [
          GoRoute(
            path: '/',
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: const HomePage(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: CurvedAnimation(
                    parent: animation,
                    curve: Curves.easeInOut,
                  ),
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(1.0, 0.0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  ),
                );
              },
            ),
          ),
          GoRoute(
            path: '/favorites',
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: const FavoritesPage(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: CurvedAnimation(
                    parent: animation,
                    curve: Curves.easeInOut,
                  ),
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(-1.0, 0.0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ],
  );
}
