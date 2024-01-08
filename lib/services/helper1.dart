
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wallpaperapp/services/model1.dart';

class Helper1{
  late Future<List<Photos>> photosList;
  Future<List<Photos>> getApi() async{
       await http.get(Uri.parse("https://api.pexels.com/v1/curated?per_page=80"),
    headers: {
      'Authorization':'F0LNExSykowwnmuJwmJ4GLwtV3h4HahYF9GpwGw9W5whU2MFkJbkYNnl'
    }
    ).then((value) => {
       photosList=jsonDecode(value.body)
    });
   return photosList; 
  }
}