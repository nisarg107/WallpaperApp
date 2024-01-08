import 'package:flutter/material.dart';
import 'package:wallpaperapp/mainpages/fullscreen.dart';

class Card1 extends StatefulWidget {
  const Card1({super.key,required this.immage});
final String immage;
  @override
  State<Card1> createState() => _Card1State();
}

class _Card1State extends State<Card1> {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(8),
    child: ClipRRect(borderRadius: BorderRadius.circular(10),
    child: GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>FullScreen(imgUrl: widget.immage)));
      },
      child: Container(
        height: MediaQuery.of(context).size.height*0.2,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          boxShadow: [
             BoxShadow(
                  color: Colors.white,
                  spreadRadius: 1,
                  blurRadius: 0.6,
                  offset: Offset(1, 1)),
          ],
          image: DecorationImage(image: NetworkImage(widget.immage),fit: BoxFit.fill)
        ),
        
      ),
    ),
    ),
    );
  }
}