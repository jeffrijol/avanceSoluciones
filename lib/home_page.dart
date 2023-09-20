import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'package:activos/presentation/screens/screens.dart';
import 'routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => ResponsiveWrapper.builder(
        child,
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.autoScale(450, name: MOBILE),
          const ResponsiveBreakpoint.autoScale(800, name: TABLET),
          const ResponsiveBreakpoint.autoScale(1000, name: DESKTOP),
        ],
        background: Container(color: const Color(0xFFF5F5F5)),
      ),
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        return Routes.fadeThrough(settings, (context) {
          return Scaffold(
            body: Container(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: ResponsiveWrapper(
                minWidth: 450,
                maxWidth: 1000,
                defaultScale: true,
                breakpoints: const [
                  ResponsiveBreakpoint.autoScale(450, name: MOBILE),
                  ResponsiveBreakpoint.autoScale(800, name: TABLET),
                  ResponsiveBreakpoint.autoScale(1000, name: DESKTOP)
                ],
                /* child: BouncingScrollWrapper(
                  child: SingleChildScrollView(
                      child: ConstrainedBox(constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height,),
                      child: buildPage(settings.name ?? ''))
                      ),
                ), */
                 child: BouncingScrollWrapper.builder(
                  context,
                  ConstrainedBox(constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height,),
                      child: buildPage(settings.name ?? ''))
                  //buildPage(settings.name ?? ''),
                  //dragStartBehavior: DragStartBehavior.down,
                ), 
              ),
            ),
          );
        });
      },
      
      debugShowCheckedModeBanner: false,
    );
  }

  Widget buildPage(String name) {
    switch (name) {
      case '/':
      case RentalHouseHome.name:
        return const RentalHouseHome();
      default:
        return const RentalHouseServices();
    }
  }
}
