import 'package:flutter/material.dart';
import 'package:login/view-model/data_view.dart';
import 'package:login/repositories/api_repositories.dart';
import 'package:login/route/route.dart';
import 'package:login/route/routes_name.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(MultiProvider(
    providers: [Provider(create: (context) => DataViewModel())],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: routeName.loginScreen,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
