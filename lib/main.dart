import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jordyhers/services/firebase_service.dart';
import 'package:jordyhers/services/url_launcher.dart';
import 'package:jordyhers/utils/theme.dart' as th;
import 'package:jordyhers/view/layout_template.dart';
import 'package:provider/provider.dart';

import 'locator.dart';

void main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    EasyDynamicThemeWidget(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jordy Hers',
      theme: th.Style.lightTheme,
      darkTheme: th.Style.darkTheme,
      themeMode: EasyDynamicTheme.of(context).themeMode,
      home: Provider(
          create: (_) => WebService(),
          child: Provider(
              create: (_) => FirestoreService(), child: LayoutTemplate())),
    );
  }
}
