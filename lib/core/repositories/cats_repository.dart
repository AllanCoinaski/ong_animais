import 'dart:convert';
import 'package:ong_animais/core/models/cats_model.dart';
import 'package:ong_animais/core/services/cats_service.dart';

///Classe para apenas os requests de forma fácil, podendo ter vários repositories.
class CatsRepository {
  final CatsService _catsService = CatsService();
  ///Função para chamar o serviço de request dos gatos
  Future<dynamic> fetchCats(limit, page) async {
    List<CatsModel> catsList = [];
    var data = await _catsService.fetchCats(limit, page);
    if (data.containsKey("success") == true) {
      jsonDecode(data["result"])
          .forEach((e) => {catsList.add(CatsModel.fromJson(e))});
      return catsList;
    } else {
      return null;
    }
  }
}
