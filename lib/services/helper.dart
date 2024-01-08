import 'package:wallpaperapp/services/wallmodel.dart';
import 'package:flutter/services.dart' as the_bundle;
class Helper{
  Future<List<WallpaperModel>> getWallpaper() async{
    final response=await the_bundle.rootBundle.loadString("assets/json/immage.json");
    final wallList=wallpaperfromJson(response);
    return wallList;
  }
}
