import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';

class FullScreen extends StatefulWidget {
  const FullScreen({super.key,required this.imgUrl});
  final String imgUrl;
  @override
  State<FullScreen> createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
  Future<void> setwallpaper() async{
    int loaction=WallpaperManager.HOME_SCREEN;
    var file=await DefaultCacheManager().getSingleFile(widget.imgUrl);
    bool result=await WallpaperManager.setWallpaperFromFile(file.path,loaction);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        children: [
          Expanded(child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10)
            ),
            child: Image.network(widget.imgUrl,fit: BoxFit.fill,),
          )),
          InkWell(
            onTap: () {
              setwallpaper();
            },
            child: Container(
              height: 60,
              width: double.infinity,
              color: Colors.black,
              child: const Center(
                child: Text(
                  "Set Wallpaper",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}