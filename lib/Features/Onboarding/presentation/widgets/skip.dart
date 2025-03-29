import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mennaallah_mohamed/core/app_router/app_router.dart';
import 'package:mennaallah_mohamed/core/utils/app_string.dart';

class Skip extends StatelessWidget {
  const Skip({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          GoRouter.of(context).push(AppRouter.kHomeScreen);
        },
        child: Text(AppString.skip));
  }
}
