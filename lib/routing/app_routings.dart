import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../screens/splash_screen.dart';
import 'app_pages.dart';
import 'router.dart';

final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
GlobalKey<ScaffoldMessengerState>();

class AppRouting extends StatefulWidget {
  const AppRouting({Key? key}) : super(key: key);

  @override
  State<AppRouting> createState() => _AppRoutingState();
}

class _AppRoutingState extends State<AppRouting> {
  GoRouter? router;
  String initialRoute = AppPages.splashPath;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initialiseRouting();
    });
  }

  void initialiseRouting() {
    initialRoute = AppPages.splashPath;
    router = buildRouter(initialRoute);
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    if (router == null) {
      return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      );
    }

    return MultiProvider(
      providers: [

        // ChangeNotifierProvider(create: (_) => AuthProvider()),
        // ChangeNotifierProvider(create: (_) => BookingProvider()),
      ],
      child: MaterialApp.router(
        scaffoldMessengerKey: rootScaffoldMessengerKey,
        routerConfig: router,
        title: 'Car Rental Booking App',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
      ),
    );
  }
}
