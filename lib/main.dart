import 'package:activos/Provider/AuthProvider/auth_provider.dart';
import 'package:activos/Provider/Database/db_provider.dart';
import 'package:activos/Provider/TaskProvider/add_task_provider.dart';
import 'package:activos/Provider/TaskProvider/delete_task_provider.dart';
import 'package:activos/Utils/Styles/colors.dart';
import 'package:activos/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthenticationProvider()),
        ChangeNotifierProvider(create: (_) => DatabaseProvider()),
        ChangeNotifierProvider(create: (_) => AddTaskProvider()),
        ChangeNotifierProvider(create: (_) => DeleteTaskProvider()),
      ],
      child: MaterialApp(
        title: 'Avance Solutions',
        theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Pallete.backgroundColor),
        home: const SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
