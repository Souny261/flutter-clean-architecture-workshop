import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workshop/config/theme/app_themes.dart';

import 'config/routes/app_router.dart';
import 'config/routes/route_utils.dart';

import 'core/services/translate_service.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(translate(context).helloWorld),
      ),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            final locale = ref.watch(localeProvider.notifier);
            return Column(
              children: [
                Text(translate(context).hello("ເຕ້ຍ")),
                MaterialButton(
                  color: AppColors.colorPrimary,
                  onPressed: () {
                    locale.setLocale(const Locale('en'));
                  },
                  child: const Text(
                    "En",
                    style: TextStyle(
                        color: AppColors.colorWhite,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                ),
                MaterialButton(
                  color: AppColors.colorPrimary,
                  onPressed: () {
                    locale.setLocale(const Locale('lo'));
                  },
                  child: const Text(
                    "Lao",
                    style: TextStyle(
                        color: AppColors.colorWhite,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                ),
                MaterialButton(
                  color: AppColors.colorPrimary,
                  onPressed: () {
                    AppRouter.router.push(PAGES.todos.screenPath);
                  },
                  child: const Text(
                    "GO",
                    style: TextStyle(
                        color: AppColors.colorWhite,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
