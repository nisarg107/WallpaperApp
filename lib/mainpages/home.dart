import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wallpaperapp/services/helper.dart';
import 'package:wallpaperapp/services/wallmodel.dart';
import 'package:wallpaperapp/utils/card.dart';
import 'package:wallpaperapp/utils/card1.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}
final TextEditingController _searchController=TextEditingController();
class _HomeState extends State<Home> with TickerProviderStateMixin{
  late Future<List<WallpaperModel>> _wallpaper;
  void wallModel(){
    _wallpaper=Helper().getWallpaper();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    wallModel();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(child: Padding(padding: EdgeInsets.all(10),
      
      )),
      backgroundColor: const Color.fromARGB(234, 255, 255, 255),
      body: NestedScrollView(
        scrollDirection: Axis.vertical,
        headerSliverBuilder: (context,index){
        return <Widget>[
          SliverAppBar(
              automaticallyImplyLeading: false,
              leadingWidth: 0,
              title: Padding(padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(padding: EdgeInsets.only(top:10,left: 15),
                  child: Container(
                    height: 50,
                    width: 50,
                    child: const Center(
                      child: Icon(Icons.menu,size: 30,color: Colors.black,),
                    ),
                  ),
                  ),
                  
                ],
                
              ),
              ),
              pinned: true,
              floating: true,
              snap: false,
              backgroundColor: Colors.transparent,
              
            ),
        ];
      }, body: SingleChildScrollView(
        child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 20, left: 20),
                      child: Text(
                        "Wallpapers",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 15, right: 15),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            child: Container(
                              height: 50,
                              width: 350,
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.white,
                                        offset: Offset(0.0, 2.0),
                                        blurRadius: 6.0,
                                        
                                        )
                                  ]),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 50,
                                        child: const Center(child: Icon(Icons.search)),
                                      ),
                                      Expanded(
                                        child: TextFormField(
                                          controller: _searchController,
                                          decoration: const InputDecoration(
                                            hintText: "Search",
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20,),
                   SizedBox(
                    height: MediaQuery.of(context).size.height*0.38,
                     child: FutureBuilder<List<WallpaperModel>>(future: _wallpaper, builder: (context,snapshot){
                       if(snapshot.connectionState==ConnectionState.waiting){
                                    return const CircularProgressIndicator();
                                  }
                                  else if(snapshot.hasError){
                                    return Text("Error ${snapshot.error}");
                                  }
                                  else{
                                    final app=snapshot.data;
                                    return ListView.builder(
                                      itemCount: app!.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context,index){
                                        final wall=snapshot.data![index];
                                        return WallpaperCard(immage: wall.image);
                                    }
                                    );
                                  }
                     }),
                   ),
                    const SizedBox(
                    height: 20,
                   ),
                   const Padding(
                     padding: const EdgeInsets.all(8.0),
                     child:  Text(
                                 "Popular",
                                 style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                               ),
                   ),
                  SizedBox(height: 20,),
                 SizedBox(
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: FutureBuilder<List<WallpaperModel>>(future: _wallpaper, builder: (context,snapshot){
                       if(snapshot.connectionState==ConnectionState.waiting){
                                    return const CircularProgressIndicator();
                                  }
                                  else if(snapshot.hasError){
                                    return Text("Error ${snapshot.error}");
                                  }
                                  else{
                                    final app=snapshot.data;
                                    return   MasonryGridView.builder(
                    gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  itemCount: app!.length,
                  shrinkWrap: true,
                  itemBuilder: ((context, index) {
                    final waal= snapshot.data![index];
                    return Card1(immage: waal.image);
                  }));
                                  }
                     }),
                 )
                  ],
                ),
      ),
      ),
    );
  }
}