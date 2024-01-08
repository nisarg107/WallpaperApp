import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class InsertImage extends StatefulWidget {
  const InsertImage({super.key});

  @override
  State<InsertImage> createState() => _InsertImageState();
}

class _InsertImageState extends State<InsertImage> with TickerProviderStateMixin{
   List<XFile> _images = [];

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _images.add(image);
      });
    }
  }
  late final TabController _tabController =
      TabController(length: 3, vsync: this);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage("https://cdn.photoroom.com/v1/assets-cached.jpg?path=backgrounds_v3/black/Photoroom_black_background_extremely_fine_texture_only_black_co_c756a0c0-4895-4275-845b-7a20f085e432.jpg")
                )),
          ),
          Padding(padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "Content Manager",
                  style: GoogleFonts.aBeeZee(color: Colors.white, fontSize: 40),
                ),
                 SizedBox(
                  height: 50,
                ),
                TabBar(
                    controller: _tabController,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: Colors.transparent,
                    isScrollable: true,
                    labelColor: Colors.white,
                    labelStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                    unselectedLabelColor: Colors.grey.withOpacity(0.3),
                    tabs: const [
                      Tab(
                        text: "Upload",
                      ),
                      Tab(
                        text: "Draft",
                      ),
                      Tab(
                        text: "Published",
                      ),
                    ]),
            ],
          ),
          ),
          Padding(padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.25),
                child: Container(
                  padding: EdgeInsets.only(left: 12),
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                       GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 4.0,
                    crossAxisSpacing: 4.0,
                  ),
                  itemCount: _images.length + 1, // Add one for the add button
                  itemBuilder: (context, index) {
                    if (index == _images.length) {
                      return Center(
                        child: ElevatedButton(
                          onPressed: _pickImage,
                          child: Icon(Icons.add),
                        ),
                      );
                    } else {
                      return Image.file(File(_images[index].path),
                          fit: BoxFit.cover);
                    }
                  },
                ),
                GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 4.0,
                    crossAxisSpacing: 4.0,
                  ),
                  itemCount: _images.length + 1, // Add one for the add button
                  itemBuilder: (context, index) {
                    if (index == _images.length) {
                      return Center(
                        child: ElevatedButton(
                          onPressed: _pickImage,
                          child: Icon(Icons.add),
                        ),
                      );
                    } else {
                      return Image.file(File(_images[index].path),
                          fit: BoxFit.cover);
                    }
                  },
                ),
                GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 4.0,
                    crossAxisSpacing: 4.0,
                  ),
                  itemCount: _images.length + 1, // Add one for the add button
                  itemBuilder: (context, index) {
                    if (index == _images.length) {
                      return Center(
                        child: ElevatedButton(
                          onPressed: _pickImage,
                          child: Icon(Icons.add),
                        ),
                      );
                    } else {
                      return Image.file(File(_images[index].path),
                          fit: BoxFit.cover);
                    }
                  },
                ),
              ]
            ),
          ),
          ),
          ],
        ),
      )
    );
  }
}