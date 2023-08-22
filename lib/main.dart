import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_flutter_13_totally03_lec_provider/provider/album_provider.dart';
import 'package:study_flutter_13_totally03_lec_provider/view/album_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<AlbumProvider>(
        create: (context) => AlbumProvider(),
        child: const AlbumView(),
      ),
    );
  }
}
