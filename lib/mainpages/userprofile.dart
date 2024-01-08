import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 60,
                  width: 70,
                  child: Center(
                    child: Icon(Icons.arrow_back,size: 30,),
                  ),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 120,
                  width: 120,
                decoration: BoxDecoration(
                  
                  borderRadius: BorderRadius.circular(120),
                  image: DecorationImage(image: NetworkImage("https://picsum.photos/seed/28/600"),fit: BoxFit.fill)
                ),
              ),
              SizedBox(height: 20,),
              const Text("Nisarg Shah",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            
               const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'New Delhi',
                      style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600)
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      '150 followers',
                      style: TextStyle(fontSize: 20,)
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
               MasonryGridView.builder(
                  gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  itemCount: 4,
                  shrinkWrap: true,
                  itemBuilder: ((context, index) {
                    return Container(
                      height: 100,
                      width: 100,
                      color: Colors.black,
                    );
                  }))
              ],

            )
          ],
        )
      ),
    );
  }
}