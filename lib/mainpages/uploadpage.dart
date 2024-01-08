import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaperapp/mainpages/fullscreen.dart';


class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  @override
  List images=[];
  int page=1;
  late Map<String,dynamic> result;
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchapi();
  }
  
  fetchapi() async{
    await http.get(Uri.parse("https://api.pexels.com/v1/curated?per_page=80"),
        headers: {
          'Authorization':
              'F0LNExSykowwnmuJwmJ4GLwtV3h4HahYF9GpwGw9W5whU2MFkJbkYNnl'
        }).then((value) => {
           result=jsonDecode(value.body),
          setState(() {
          images=result['photos'];
        }),
        });
        print(result);
  }
  loadMore() async{
    setState(() {
      page=page+1;
    });
    String url='https://api.pexels.com/v1/curated?per_page=80&page=' + page.toString();
    await http.get(Uri.parse(url),
        headers: {
          'Authorization':
              'F0LNExSykowwnmuJwmJ4GLwtV3h4HahYF9GpwGw9W5whU2MFkJbkYNnl'
        }).then((value) => {
          result = jsonDecode(value.body),
          setState(() {
            images.addAll(result['photos']);
          }),
        });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.amber,
     body: Column(
       children:[ Expanded(child: Container(
         child: GridView.builder(
                             itemCount: images.length,
                             scrollDirection: Axis.vertical,
                             gridDelegate:
                                 const SliverGridDelegateWithFixedCrossAxisCount(
                               crossAxisCount: 3,
                               crossAxisSpacing: 2,
                               childAspectRatio: 2 / 3,
                               mainAxisSpacing: 2,
                             ),
                             itemBuilder: ((context, index) {
                               return GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>FullScreen(imgUrl: images[index]['src']['large2x'])));
                                },
                                 child: Container(
                                  child: Image.network(images[index]['src']['tiny'],fit: BoxFit.fill,),
                                   color: Colors.white,
                                   
                                 ),
                               );
                             }),
                           )
       )
       ),
       InkWell(
        onTap: () {
          loadMore();
        },
        child: Container(
          height: 60,
          width: double.infinity,
          color: Colors.black,
          child: Center(
            child: Text("Load More",style: TextStyle(fontSize: 20,color: Colors.white),),
            
          ),
        ),
       )
       ]
     )
    );
  }
}