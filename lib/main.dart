import 'package:fast_location/src/shared/storage/local_storage.dart';
import 'package:flutter/material.dart';

import 'src/modules/history/page/history_page.dart';
import 'src/modules/home/page/home_page.dart';
import 'src/modules/initial/page/initial_page.dart';
import 'src/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocalStorage.initHiveDatabase();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppRoutes.initialPage,
      routes: {
        AppRoutes.initialPage: (context) => const InitialPage(),
        AppRoutes.homePage: (context) => HomePage(),
        AppRoutes.historyPage: (context) => HistoryPage(),
      },
    );
  }
}