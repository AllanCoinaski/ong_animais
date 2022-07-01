import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:ong_animais/core/models/users_model.dart';
import 'package:ong_animais/shared/utils/storage_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

///Classe com funções relacionadas ao Login do usuário.
class LoginService {
  ///Função que autentica o usuário.
  Future<bool> authenticate(String email) async {
    try {
      List<UsersModel> users = [];
      String data = await rootBundle.loadString('lib/assets/credentials.json');
      var jsonResult = json.decode(data);
      jsonResult.forEach((e) => {users.add(UsersModel.fromJson(e))});
      for (var i = 0; i < users.length; i++) {
        if (users[i].email == email) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString(
              StorageKeys.isLoggedEmail, users[i].email.toString());
          await prefs.setString(StorageKeys.nameUser, users[i].name.toString());
          return true;
        }
      }
      return false;
    } catch (error) {
      return false;
    }
  }
}
