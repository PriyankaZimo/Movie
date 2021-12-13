import 'dart:io';

import 'package:flutter/material.dart';
import 'package:movieproject/newlist/list_page.dart';
import 'package:movieproject/profilepage/contentpage.dart';
import 'package:movieproject/provider/provider_page.dart';
import 'package:provider/provider.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Movieproject',
        debugShowCheckedModeBanner: false,
        home: ChangeNotifierProvider(
          create: (context) =>ProviderPage(),child: ListPage(),
        ));
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
