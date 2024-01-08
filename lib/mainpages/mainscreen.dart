import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaperapp/mainpages/categorypage.dart';
import 'package:wallpaperapp/mainpages/home.dart';
import 'package:wallpaperapp/mainpages/uploadpage.dart';
import 'package:wallpaperapp/mainpages/userprofile.dart';
import 'package:wallpaperapp/services/pagenotifier.dart';
import 'package:wallpaperapp/utils/bottomnav.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}
List<Widget> pageList=[
  Home(),
  CategoryPage(),
  UploadPage(),
  UserProfile(),
];
class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    int page_Index=4;
    return Consumer<PageNotifier>(builder: (context, value, child) {
      return Scaffold(
        backgroundColor: Colors.white12,
        body: pageList[value.activePage],
        bottomNavigationBar: SafeArea(child: Padding(padding: EdgeInsets.all(12),child: Container(
          padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BottomNav(
                        onTap: () {
                          value.pageIndex = 0;
                        },
                        icon: value.activePage == 0
                            ? Icons.home
                            : Icons.home_filled),
                    BottomNav(
                        onTap: () {
                          value.pageIndex = 1;
                        },
                        icon: value.activePage == 1
                            ? Icons.category_outlined
                            : Icons.category),
                    
                    BottomNav(onTap: (){
                      value.pageIndex=2;
                    }, icon: value.activePage==2?Icons.upload:Icons.upload_file_outlined),
                   
                    BottomNav(
                        onTap: () {
                          value.pageIndex = 3;
                        },
                        icon: value.activePage == 3
                            ? Icons.person
                            : Icons.person_2_outlined),
                    
                    
                    
                  ],  
                ),
        ),),
        ),
      );
    },  
    );
  }
}