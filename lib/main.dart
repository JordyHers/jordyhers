import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jordyhers/services/firebase_service.dart';
import 'package:jordyhers/services/url_launcher.dart';
import 'package:jordyhers/utils/theme.dart' as th;
import 'package:jordyhers/view/layout_template.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'locator.dart';

void main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    EasyDynamicThemeWidget(
      child: MultiProvider(providers: [
        Provider(create: (_) => WebService()),
        Provider(create: (_) => FirestoreService()),
      ], child: MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jordy Hers',
      theme: th.Style.lightTheme,
      darkTheme: th.Style.darkTheme,
      themeMode: EasyDynamicTheme.of(context).themeMode,
      home: LayoutTemplate(),
    );
  }
}
