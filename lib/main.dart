import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:onlineshop/providers/bottom_bar_provider.dart';
import 'package:onlineshop/providers/catigory_provider.dart';
import 'package:onlineshop/providers/color_provider.dart';
import 'package:onlineshop/providers/show_pssword_provider.dart';
import 'package:onlineshop/routes/my_route.dart';
import 'package:provider/provider.dart';

void main(List<String> args) async {
  await Hive.initFlutter();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ShowPsswdProvider()),
        ChangeNotifierProvider(create: (_) => CatigoryProvider()),
        ChangeNotifierProvider(create: (_) => BottomBarProvider()),
        ChangeNotifierProvider(create: (_) => ColorProductProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final MyRoute _myRoute = MyRoute();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.cyan),
      initialRoute: '/',
      onGenerateRoute: _myRoute.onGenerateRoute,
    );
  }
}
