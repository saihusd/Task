import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class NetworkService{

  Future<List> fetchApiFunction({required String url}) async {
    print("url : $url");
   try{
     var response = await http.get(Uri.parse(url));
     var decodedResponse = jsonDecode(response.body);
     if (kDebugMode) {
       print("response of infinite list : $decodedResponse");
     }
     return decodedResponse;
   }catch(e){
     if (kDebugMode) {
       print("error : $e");
     }
     return [];
   }
  }

}