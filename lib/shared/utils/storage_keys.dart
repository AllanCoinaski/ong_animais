import 'package:shared_preferences/shared_preferences.dart';

///Classe para armazenar dados relacionados ao usuário logado.
class StorageKeys {
  static const String isLoggedEmail = "EMAIL_USER";
  static const String nameUser = "NAME_USER";
}

class StorageService {
  late SharedPreferences prefs;
  static Future<SharedPreferences> getPrefsInstance() async {
    return await SharedPreferences.getInstance();
  }
}
