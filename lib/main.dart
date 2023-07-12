import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workshop/config/DI/configure_dependencies.dart';

import 'config/routes/app_router.dart';
import 'config/theme/app_themes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'core/services/translate_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);
    return MaterialApp.router(
        title: 'Flutter Demo',
        theme: theme(),
        routeInformationProvider: AppRouter.router.routeInformationProvider,
        routeInformationParser: AppRouter.router.routeInformationParser,
        routerDelegate: AppRouter.router.routerDelegate,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        locale: locale,
        supportedLocales: AppLocalizations.supportedLocales);
  }
}
