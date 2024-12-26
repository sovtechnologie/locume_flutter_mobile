import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locume/Theme/theme.dart';
import 'package:locume/api/auth_provider.dart';
import 'package:locume/firebase_options.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(AuthProvider());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Locume',
      theme: themeData(context),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
