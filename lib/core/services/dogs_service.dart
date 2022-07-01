import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:ong_animais/shared/utils/api_url.dart';

///Classe de requests relacionados aos cachorros
class DogsService {
  ///Busca os cachorros na api indicada
  Future<Map<String, dynamic>> fetchDogs(limit, page) async {
    var url = Uri.parse(
        "${ApiUrl.apiDogs}/images/search?limit=$limit&page=$page&mime_types=jpg,png&has_breeds=true&size=med&format=json&order=Rand");
    try {
      var response = await http.get(url);
      if ((response.statusCode == 200) || (response.statusCode == 201)) {
        http.Client().close();
        return {"success": true, "result": response.body};
      }
      return {"success": false, "result": response.body};
    } catch (error) {
      return {"success": false, "result": "request error"};
    }
  }
}
