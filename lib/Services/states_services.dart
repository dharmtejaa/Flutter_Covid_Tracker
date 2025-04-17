import 'dart:convert';
import 'package:covid_tracker/Model/world_states_model.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

// base url for the API
String baseUrl = 'https://disease.sh/v3/covid-19/';

/// class to get the data from the API
class StatesServices {
  /// function to get the data of world states
  Future<WorldStatesModel> getWorldStatesApi() async {
    final response = await http.get(
      Uri.parse('${baseUrl}all'),
    );
    if (response.statusCode == 200) {
      return WorldStatesModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to Load data of world states');
    }
  }

  /// function to get the data of countries
  Future<List<dynamic>> getCountriesListAPI() async {
    final response = await http.get(
      Uri.parse('${baseUrl}countries'),
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Failed to load data of countries');
    }
  }
}
