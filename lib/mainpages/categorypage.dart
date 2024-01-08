import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           const Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
      child: Text(
        'Category',
        style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
      ),
      ),
           SizedBox(height: 20,),
           SingleChildScrollView(
            scrollDirection: Axis.horizontal,
             child: Row(
              children: List.generate(
                5, (index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:  Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: Colors.white,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                      child: Text(
                        'Cat',
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.w200),
                      ),
                    ),
                  ),
                );
              }),
             ),
           ),
           SizedBox(height: 30,),
           Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 5, 0, 0),
                  child: Container(
                    width: 51,
                    height: 51,
                    decoration: BoxDecoration(
                      color: Color(0xFF090808),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30,),
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'Recommended',
              style: TextStyle(
                    fontFamily: 'Readex Pro',
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          SizedBox(height: 30,),
          Column(
            children: [
              MasonryGridView.builder(
                itemCount: 4,
                shrinkWrap: true,
        padding: EdgeInsets.zero,
        gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
        scrollDirection: Axis.vertical,
        itemBuilder: (context,index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 61,
                  height: 46,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 5, 0, 0),
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Color(0xFF090808),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              "https://picsum.photos/seed/28/600",
                              width: 300,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Category",
                              style:
                                 TextStyle(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                            ),
                          Text(
                              '405',
                              style: TextStyle(
                                    fontFamily: 'Readex Pro',
                                    color:Colors.white,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
        },
      ),
            ],
          ),
        ],
      ),
    );
  }
}