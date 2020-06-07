import 'dart:convert';
import 'package:tech_task/lunch_fridge/model/ingredient_model.dart';
import 'package:http/http.dart' as http;
import 'package:tech_task/shared/util/constants.dart';

class IngredientAPI {
  Future<List<IngredientModel>> getIngredients() async {
    var client = http.Client();
    List<IngredientModel> ingredients;

    String url = kLunchBaseURL + '/ingredients';
    var headers = {'Content-Type': 'application/json'};

    final response = await client.get(
      url,
      headers: headers
    );

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body) as List<dynamic>;

      ingredients = result.map((item) {
        return IngredientModel.fromJson(item);
      }).toList();

      return ingredients;
    } else {
      return Future.error('Something went wrong.');
    }
  }
}
