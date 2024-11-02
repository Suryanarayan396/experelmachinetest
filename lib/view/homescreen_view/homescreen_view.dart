import 'package:experelmachinetest/view/homescreen_view/bloc/product/bloc/product_bloc.dart';
import 'package:experelmachinetest/view/homescreen_view/bloc/product/bloc/product_state.dart';
import 'package:experelmachinetest/view/homescreen_view/widget/categorycard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomescreenView extends StatelessWidget {
  const HomescreenView({super.key});

  @override
  Widget build(BuildContext context) {
    // Providing ProductBloc with the Apiservice
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Icon(Icons.menu, color: Colors.black),
        actions: const [
          Icon(
            Icons.shopping_cart,
            size: 30,
            color: Colors.black,
          ),
          SizedBox(width: 20),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Discover our exclusive\nproducts",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "In this marketplace, you will find various\ntechniques at the cheapest prices.",
              style: TextStyle(color: Colors.black.withOpacity(0.5)),
            ),
            SizedBox(height: 30),
            Expanded(
              child: BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  if (state is ProductLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is ProductLoaded) {
                    // Ensure that products are displayed correctly
                    return ListView.separated(
                      itemBuilder: (context, index) {
                        final category =
                            state.productsByCategory.keys.toList()[index];
                        final products =
                            state.productsByCategory[category] ?? [];
                        return Categorycard(
                          title: category,
                          itemcount: products.length,
                          products: products,
                        );
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 30),
                      itemCount: state.productsByCategory.length,
                    );
                  } else if (state is ProductError) {
                    return Center(child: Text(state.message));
                  }
                  return Container(); // Fallback case
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
