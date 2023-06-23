import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:workshop/root.dart';
import '../../feature/todos/presentation/cubit/todos_cubit.dart';
import '../../feature/todos/presentation/page/index.dart';
import '../DI/configure_dependencies.dart';
import 'route_utils.dart';
import 'screens/not_found_page.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final GoRouter _router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: PAGES.root.screenPath,
        name: PAGES.root.screenName,
        builder: (context, state) => const RootPage(),
      ),
      GoRoute(
        path: PAGES.todos.screenPath,
        name: PAGES.todos.screenName,
        builder: (context, state) => BlocProvider<TodosCubit>(
          create: (context) => getIt(),
          child: const TodosIndex(),
        ),
      ),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );
  static GoRouter get router => _router;
}
