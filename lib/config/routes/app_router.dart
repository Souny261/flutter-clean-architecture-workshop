import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workshop/feature/todos/presentation/page/saved_todo_list_page.dart';
import 'package:workshop/root.dart';
import '../../feature/todos/presentation/page/index.dart';
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
      // With Bloc
      // GoRoute(
      //   path: PAGES.todos.screenPath,
      //   name: PAGES.todos.screenName,
      //   builder: (context, state) => BlocProvider<TodosCubit>(
      //     create: (context) => getIt(),
      //     child: const TodosIndex(),
      //   ),
      // ),
      GoRoute(
        path: PAGES.todos.screenPath,
        name: PAGES.todos.screenName,
        builder: (context, state) => const TodosIndex(),
      ),
      GoRoute(
        path: PAGES.savedTodo.screenPath,
        name: PAGES.savedTodo.screenName,
        builder: (context, state) => const SavedTodoListPage(),
      ),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );
  static GoRouter get router => _router;
}
