
import 'package:flutter/material.dart';

class WallpaperCard extends StatefulWidget {
  const WallpaperCard({super.key,required this.immage});
  final String immage;
  @override
  State<WallpaperCard> createState() => _WallpaperCardState();
}

class _WallpaperCardState extends State<WallpaperCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(10),
    child: ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      child: Container(
        height: MediaQuery.of(context).size.height*0.35,
        width: MediaQuery.of(context).size.width*0.6,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.white,
                spreadRadius: 1,
                blurRadius: 0.6,
                offset: Offset(1, 1)),
          ]
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height*0.355,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(widget.immage),
                            fit: BoxFit.fill)),
                  ),
                  
                ],
              ),
            ],
          ),
      ),
    ),
    );
  }
}