import 'package:flutter/material.dart';
import 'package:ong_animais/routes/routes_model.dart';
import 'package:ong_animais/ui/adoption_page.dart';
import 'package:ong_animais/ui/animal_page.dart';
import 'package:ong_animais/ui/home_page.dart';
import 'package:ong_animais/ui/login_page.dart';

///Gerencia o direcionamento de cada rota do aplicativo
class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginPage(),settings: const RouteSettings(name: 'LoginPage'));  
       case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomePage(),settings: const RouteSettings(name: 'HomePage'));   
      case Routes.adoption:
        var data = settings.arguments;
        return MaterialPageRoute(builder: (_) =>  AdoptionPage(type: data.toString()),settings: const RouteSettings(name: 'AdoptionPage'));   
      case Routes.animal:
        Object? data = settings.arguments;
        return MaterialPageRoute(builder: (_) =>  AnimalPage(animal: [data],),settings: const RouteSettings(name: 'AnimalPage'));                         
    }
    return MaterialPageRoute(builder: (_) => const LoginPage());
  }
}