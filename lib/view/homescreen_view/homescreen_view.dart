import 'package:experelmachinetest/product/bloc/product_bloc.dart';
import 'package:experelmachinetest/view/productscreen_view/productscreen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomescreenView extends StatelessWidget {
  const HomescreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Icon(Icons.menu, color: Colors.black),
        actions: [
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
                  if (state.product == null || state.product!.isEmpty) {
                    return Center(child: CircularProgressIndicator());
                  }

                  return ListView.separated(
                    itemBuilder: (context, index) {
                      final category = state.product![index];
                      return Column(
                        // Return the Column widget
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            category.category ?? '',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Container(
                            height: 150, // Fixed height for inner ListView
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: category.images?.length ?? 0,
                              itemBuilder: (context, itemIndex) => InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductscreenView(),
                                    ),
                                  );
                                },
                                child: Container(
                                  width: 100,
                                  margin: EdgeInsets.only(right: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.network(
                                        category.images![
                                            itemIndex], // Placeholder URL
                                        fit: BoxFit.cover,
                                      ),
                                      Text(category.title ?? ""),
                                      Text(
                                        category.description ?? "",
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        '${category.price}', // Use itemIndex here for price
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(height: 40),
                    itemCount: state.product!.length,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
