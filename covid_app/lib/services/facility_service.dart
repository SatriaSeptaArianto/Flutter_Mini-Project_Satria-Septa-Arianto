import 'package:covid_app/models/facility_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FacilityService{
  Future<List<FacilityModel>> getFacilityData() async {
    final response =
        await http.get(Uri.parse("https://kipi.covid19.go.id/api/get-faskes-vaksinasi?skip=0&province=KALIMANTAN+TENGAH&city=KOTA+PALANGKARAYA"));

    var jsonObject = json.decode(response.body);
    List<dynamic> data = (jsonObject as Map<String, dynamic>)['data'];

    List<FacilityModel> listData = [];
    for (int i = 0; i < data.length; i++) {
      listData.add(FacilityModel.fromJson(data[i]));
    }
    
    return listData;
    // if (response.statusCode == 200) {
    //   List jsonResponse = json.decode(response.body);
    //     return jsonResponse.map((data) => FacilityModel.fromJson(data)).toList();
    // } else {
    //   throw Exception('Unexpected error occured!');
    // }
  }
  // Future<FacilityModel> getFacilityData() async{
  //   var link = Uri.parse("https://kipi.covid19.go.id/api/get-faskes-vaksinasi?skip=0&province=KALIMANTAN+TENGAH&city=KOTA+PALANGKARAYA");
  //   final data = await http.Client().get(link);
    
  //   if(data.statusCode != 200) {
  //     throw Exception();
  //   }
      
  //   FacilityModel resultF = FacilityModel.fromJson(json.decode(data.body));
    
  //   return resultF;
  // }  
}