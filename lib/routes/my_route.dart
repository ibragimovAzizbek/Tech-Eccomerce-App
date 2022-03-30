import 'package:flutter/material.dart';
import 'package:onlineshop/views/home/cart/cart_page.dart';
import 'package:onlineshop/views/home/home_sceens.dart';
import 'package:onlineshop/views/info/info_page.dart';
import 'package:onlineshop/views/login_up/login_page.dart';
import 'package:onlineshop/views/splash/splash_page.dart';

class MyRoute {
  Route? onGenerateRoute(RouteSettings settings) {
    var args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashPage());

      case '/login':
        return MaterialPageRoute(builder: (_) => LoginPage());

      case '/home':
        return MaterialPageRoute(builder: (_) => HomeScreen());

      case '/info':
        return MaterialPageRoute(
          builder: (_) => InfoPage(
            productIndex: int.parse(args.toString()),
          ),
        );

      case '/basket':
        return MaterialPageRoute(
          builder: (_) => CartPage(
            productIndex: int.parse(
              args.toString(),
            ),
          ),
        );
    }
  }
}
