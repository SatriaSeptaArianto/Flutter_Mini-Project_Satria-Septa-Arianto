import 'package:covid_app/models/covid_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CovidService{
  Future<CovidModel> getCovidData() async{
    var link = Uri.parse("https://data.covid19.go.id/public/api/update.json");
    final data = await http.Client().get(link);
    
    if(data.statusCode != 200) {
      throw Exception();
    }
      
    CovidModel result = CovidModel.fromJson(json.decode(data.body));
    
    return result;
  }
}