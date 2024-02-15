// ignore_for_file: unused_import
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bussines_owner/Routes/routes_managment.dart';
import 'package:go_router/go_router.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ScreenUtilInit(
        useInheritedMediaQuery: true,
        designSize: const Size(375, 812),
        builder: (context, child) {
          return MaterialApp.router(
            title: 'Jazalla',
            debugShowCheckedModeBanner: false,
            //initialRoute: splashscreen,
            // getPages: RouteManagement.getPages(),
            routerConfig: router,
          );
        });
  }
}
