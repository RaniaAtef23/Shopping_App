import 'package:animal_app/core/network/service_locator.dart';
import 'package:animal_app/features/Home/data/repo/repo_imp.dart';
import 'package:animal_app/features/Home/presentation/Manager/Fetch_Product/fetch_product_cubit.dart';
import 'package:animal_app/features/Home/presentation/Manager/Fetch_Product_Category/product_category_cubit.dart';
import 'package:animal_app/features/Home/presentation/views/Screens/HomeView.dart';
import 'package:animal_app/features/Splash/presentation/views/screens/Splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.nunitoTextTheme(
            Theme.of(context).textTheme,
          ),
          scaffoldBackgroundColor: Colors.white,
        ),
        home: const Splash_view(),

      );
  }
}