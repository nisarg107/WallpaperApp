import 'dart:convert';

List<WallpaperModel> wallpaperfromJson(String str) => List<WallpaperModel>.from(json.decode(str).map((x)=>WallpaperModel.fromJson(x)));

class WallpaperModel {
  String image;
  String by;
  String? download;
  String source;
  String id;

  WallpaperModel({
    required this.image,
    required this.by,
    this.download,
    required this.source,
    required this.id,
  });

    factory WallpaperModel.fromJson(Map<String, dynamic> json) => WallpaperModel(
    image : json['image'],
    by : json['by'],
    download : json['download'],
    source : json['source'],
    id : json['id'],
    );
}
