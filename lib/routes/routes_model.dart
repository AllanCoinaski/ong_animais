import 'package:flutter/material.dart';

///Classe para gerenciar ao rotas(caminho do arquivo da tela) do app.
class Routes {
  static const String login = '/login';
  static const String home = '/home';
  static const String adoption = '/adoption';
  static const String animal = '/animal';
}
final navKey =  GlobalKey<NavigatorState>();