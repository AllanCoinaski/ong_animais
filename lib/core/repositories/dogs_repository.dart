import 'dart:convert';
import 'package:ong_animais/core/models/dogs_model.dart';
import 'package:ong_animais/core/services/dogs_service.dart';

///Classe para apenas os requests de forma fácil, podendo ter vários repositories.
class DogsRepository {
  final DogsService _dogsService = DogsService();
  ///Função para chamar o serviço de request dos cachorros
  Future<dynamic> fetchDogs(limit, page) async {
    List<DogsModel> dogsList = [];
    var data = await _dogsService.fetchDogs(limit, page);
    if (data.containsKey("success") == true) {
      jsonDecode(data["result"])
          .forEach((e) => {dogsList.add(DogsModel.fromJson(e))});
      return dogsList;
    } else {
      return null;
    }
  }
}
