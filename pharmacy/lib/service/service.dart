import 'dart:convert';
import 'package:pharmacy/model/pharmacy.dart';
import 'package:http/http.dart' as http;

class PharmacyService{
  Future<Pharmacy> getPharmacy() async{
    final url = "http://api.kodlama.net/eczane/all";
    final response = await http.get(
      Uri.encodeFull(url),
      headers: {'Accept': 'application/json'},
    );

    if(response.statusCode == 200){
      final _jsonBody = utf8.decode(response.bodyBytes);
      final _postResponse = pharmacyFromJson(_jsonBody);
      return _postResponse;
    }else{
      throw Exception('Request failed with status: ${response.statusCode}');
    }
  }
}