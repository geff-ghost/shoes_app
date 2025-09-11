import 'package:flutter/material.dart';
import 'package:shoes_app/global_variables.dart';
import 'package:shoes_app/home_page.dart';
import 'product_details_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Lato',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(254, 206, 1, 1),
          primary: const Color.fromRGBO(254, 206, 1, 1),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16
          ),
          prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 35
          ),
          titleMedium: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0
          ),
          bodySmall: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0
          ),
        ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontSize: 25,
            color: Colors.black
          )
        )
      ),
      home: ProductDetailsPage(
        product: products[0],
      ),
    );
  }
}
