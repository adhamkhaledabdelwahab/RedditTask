import 'package:flutter/material.dart';
import 'package:reddit_task/presentation/router/app_router.dart';
import 'package:reddit_task/presentation/router/app_router_names.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Reddit Task',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: AppRouterNames.rHome,
    );
  }
}
