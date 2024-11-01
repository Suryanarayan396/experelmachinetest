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
                      return Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
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
                                itemBuilder: (context, itemIndex) {
                                  // Ensure we don't access an out-of-range index
                                  final imageUrl = category.images?[itemIndex];
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
                                              image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: NetworkImage(
                                                  imageUrl ?? '',
                                                ),
                                              ),
                                            ),
                                          ),
                                          Text(category.title ?? ""),
                                          Text(
                                            category.description ?? "",
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            '${category.price}',
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
                    separatorBuilder: (context, index) => SizedBox(height: 100),
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
