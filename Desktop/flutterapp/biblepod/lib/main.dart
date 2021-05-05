import 'package:biblepod/homepage.dart';
import 'package:biblepod/model/bibleaudio.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Biblepod',
      home: ChangeNotifierProvider(
          create: (_) => BibleAudio(), child: HomePage()),
    );
  }
}
