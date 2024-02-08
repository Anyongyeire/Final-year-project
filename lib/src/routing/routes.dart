import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login_app/src/constants/exporter.dart';
import 'package:login_app/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:login_app/src/routing/exporter.dart';
import '../common_widgets/error_display.dart';
import '../../droidcon_exporter.dart';

///* this provides the default router delegate for the app
final goRouterProvider = Provider<GoRouter>((ref) {
  return mobileRouter;
});

// router delegate
final mobileRouter = GoRouter(
  initialLocation: initialPath,
  restorationScopeId: tAppName,
  routes: [
    //* splash
    // GoRoute(
    //   path: splashPath,
    //   builder: (context, state) => const DroidconSplash(),
    // ),

    //* home page
    // GoRoute(
    //   path: homePath,
    //   builder: (context, state) => const DroidconHome(),
    // ),

    //* auth
    // GoRoute(
    //   path: authPath,
    //   builder: (context, state) => const DroidconAuth(),
    // ),

    //* welcome screen
    GoRoute(
      path: welcomePath,
      builder: (context, state) => const WelcomeScreen(),
    ),
  ],

  redirect: (_, state) {
    //TODO if the user is not logged in, redirect to the auth page

    //TODO if the user is logged in, don't redirect to any page just continue with the initial path
    return null;
  },
  errorBuilder: (context, state) => ErrorDisplay(
      error: state.error.toString(), stackTrace: StackTrace.current),
  // log diagnostic info for your routes
  debugLogDiagnostics: true,
);
