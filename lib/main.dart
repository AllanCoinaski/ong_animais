import 'package:flutter/material.dart';
import 'package:ong_animais/routes/routes_generator.dart';
import 'package:ong_animais/routes/routes_model.dart';
import 'package:ong_animais/shared/utils/storage_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: prefer_typing_uninitialized_variables
var isLogged;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isLogged = prefs.getString(StorageKeys.isLoggedEmail);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navKey,
        onGenerateRoute: RouteGenerator.generateRoute,
        initialRoute: isLogged == null ? Routes.login : Routes.home);
  }
}
