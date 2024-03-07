import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarea_5/pages/create_page.dart';
import 'package:tarea_5/pages/details_page.dart';
import 'package:tarea_5/pages/home_page.dart';
import 'package:tarea_5/providers/create_page_provider.dart';
import 'package:tarea_5/shared/providers/forage_list_provider.dart';

void main() {
  runApp(ChangeNotifierProvider<ForageListProvider>(
      create: (context) => ForageListProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Forage',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.purple,
          titleTextStyle: TextStyle(
            color: Colors.white,
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
      ),
      home: const HomePage(),
      routes: {
        '/home': (BuildContext context) => const HomePage(),
        '/create': (BuildContext context) =>
            ChangeNotifierProvider<CreatePageProvider>(
              create: (BuildContext context) => CreatePageProvider(),
              child: const CreatePage(),
            ),
        '/details': (BuildContext context) => const DetailsPage(),
      },
    );
  }
}
