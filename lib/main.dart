import 'package:experelmachinetest/product/bloc/product_bloc.dart';
import 'package:experelmachinetest/services/apiservice.dart';
import 'package:experelmachinetest/view/homescreen_view/homescreen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<ProductBloc>(
        create: (context) => ProductBloc(Apiservice())..add(Fetch()),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomescreenView(),
    );
  }
}
