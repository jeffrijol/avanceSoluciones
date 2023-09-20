import 'package:activos/presentation/providers/auth_provider.dart';
import 'package:activos/presentation/providers/db_provider.dart';
import 'package:activos/Utils/Styles/colors.dart';
import 'package:activos/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'config/config.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Avance Solutions',
      //theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Pallete.backgroundColor),
      theme: AppTheme(isDarkmode: true).getTheme(),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
