import 'package:flutter/material.dart';
import 'package:iron_dictionary_nosu/favorites_page/favorites_page.dart';
import 'package:provider/provider.dart';

import 'home_page/home_page.dart';
import 'home_page/home_page_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: true,
          create: (_) => HomePageModel(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/favorites': (BuildContext context) => FavoritesPage(),
      },
      home: HomePage(),
    );
  }
}
