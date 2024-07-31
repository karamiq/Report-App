import 'package:app/data/models/ViechleFee.dart';
import 'package:app/data/providers/user_provider.dart';
import 'package:app/src/categories/analysis.dart';
import 'package:app/src/fee_detailes/fee_detailes.dart';
import 'package:app/src/fee_is_send/fee_is_send.dart';
import 'package:app/src/home/home_page.dart';
import 'package:app/src/profile/profile.dart';
import 'package:app/src/record_of_violations/record_of_violations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../src/sign_in/login.dart';

final Provider<GoRouter> routerProvider = Provider((ref) => router);

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

Future<bool> isUserLoggedIn(context) async {
  final ref = ProviderScope.containerOf(context).read;
  return ref(userProvider.notifier).isLogin();
}

final router = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: RoutesDocument.login,
  navigatorKey: _rootNavigatorKey,
  redirect: (context, state) async {
    final loggedIn = await isUserLoggedIn(context);
    //state.uri: This refers to the Uri object of the current route state
    //which any where in the app that the context.push,go,...etc was called

    //state.uri.toString() is the currnet route url and here its checking
    //if
    final isLoggingIn = state.uri.toString() == RoutesDocument.login;

    //if (!loggedIn && !isLoggingIn) { return RoutesDocument.login; }:
    //if the user is not logged in and the current route is not the login
    //routeit redirects to the login route
    if (!loggedIn && !isLoggingIn) {
      return RoutesDocument.login;
    }
    //if (loggedIn && isLoggingIn) { return RoutesDocument.cam; }
    //If the user is logged in and the current route is the login route,
    //it redirects to the camera route (RoutesDocument.cam)

    if (loggedIn && isLoggingIn) {
      return RoutesDocument.cam;
    }
    //return null if none of the above conditions are met
    //so it'ill route to the intendent page
    return null;
  },
  routes: [
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: RoutesDocument.login,
      name: RoutesDocument.login,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: RoutesDocument.cam,
      name: RoutesDocument.cam,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: RoutesDocument.feeIsSend,
      name: RoutesDocument.feeIsSend,
      builder: (context, state) =>
          FeeIsSendPage(feeDetailes: state.extra as VehicleFee),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: RoutesDocument.feeDetailes,
      name: RoutesDocument.feeDetailes,
      builder: (context, state) =>
          FeeDetailesPage(feeDetailes: state.extra as VehicleFee),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: RoutesDocument.profile,
      name: RoutesDocument.profile,
      builder: (context, state) => const ProfilePage(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: RoutesDocument.recordOfViolations,
      name: RoutesDocument.recordOfViolations,
      builder: (context, state) => const RecordOfViolationsPage(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: RoutesDocument.categories,
      name: RoutesDocument.categories,
      builder: (context, state) => const CategoriesPage(),
    ),
  ],
);

class RoutesDocument {
  const RoutesDocument._();
  static const categories = '/categories';
  static const recordOfViolations = '/RecordOfViolations';
  static const profile = '/profile';
  static const feeDetailes = '/feeDetailes';
  static const feeIsSend = '/feeIsSend';
  static const cam = '/';
  static const login = '/login';
}
