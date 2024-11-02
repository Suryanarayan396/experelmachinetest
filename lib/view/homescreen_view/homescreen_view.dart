import 'package:experelmachinetest/view/homescreen_view/bloc/product/bloc/product_bloc.dart';

import 'package:experelmachinetest/view/homescreen_view/bloc/product/bloc/product_state.dart';

import 'package:experelmachinetest/view/productscreen_view/productscreen_view.dart';
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
                        return Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                category,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10),
                              Container(
                                height: 250, // Fixed height for inner ListView
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: products.length,
                                  itemBuilder: (context, itemIndex) {
                                    final product = products[itemIndex];
                                    return InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ProductscreenView(),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        width: 150,
                                        margin: EdgeInsets.only(right: 10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 100,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color:
                                                    Colors.grey.withOpacity(.5),
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      product.images![0]),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Text(product.title ?? ""),
                                            Text(
                                              product.description ?? "",
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text(
                                              '${product.price}',
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 50),
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
