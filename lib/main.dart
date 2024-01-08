import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaperapp/mainpages/insertimg.dart';
import 'package:wallpaperapp/mainpages/uploadpage.dart';
import 'package:wallpaperapp/services/pagenotifier.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: ((context)=>PageNotifier()))
    ],
    child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: UploadPage(),
    );
  }
}
