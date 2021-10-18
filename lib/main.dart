import 'package:flutter/material.dart';
import 'package:jordyhers/view/layout_template.dart';
import 'locator.dart';

void main() {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jordy Hers',
      theme: ThemeData(primarySwatch: Colors.indigo, fontFamily: 'Montserrat'),
      home: LayoutTemplate(),
    );
  }
}
