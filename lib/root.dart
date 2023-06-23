import 'package:flutter/material.dart';
import 'package:workshop/config/theme/app_themes.dart';

import 'config/routes/app_router.dart';
import 'config/routes/route_utils.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Root Page"),
      ),
      body: Center(
        child: MaterialButton(
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
      ),
    );
  }
}
