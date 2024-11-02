import 'package:experelmachinetest/utils/constants/colorconst.dart';
import 'package:experelmachinetest/utils/widgets/textcard.dart';
import 'package:experelmachinetest/view/productscreen_view/bloc/singleproduct/bloc/singleproduct_bloc.dart';
import 'package:experelmachinetest/view/productscreen_view/bloc/singleproduct/bloc/singleproduct_event.dart';
import 'package:experelmachinetest/view/productscreen_view/bloc/singleproduct/bloc/singleproduct_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductscreenView extends StatelessWidget {
  final int productId;
  const ProductscreenView({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    context.read<SingleproductBloc>().add(FetchProductDetail(productId));
    return BlocBuilder<SingleproductBloc, SingleproductState>(
        builder: (context, state) {
      if (state is ProductDetailLoading) {
        return Center(child: CircularProgressIndicator()); // Loading state
      } else if (state is ProductDetailLoaded) {
        final product = state.singleproduct;
        print(product.images.toString());
        print(product.images![0].toString());

        return Scaffold(
          backgroundColor: Color(0xffada8ef),
          body: Column(
            children: [
              Expanded(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(Icons.arrow_back_ios_new)),
                              Spacer(),
                              IconButton(
                                  onPressed: () {}, //to cart page
                                  icon: Icon(Icons.shopping_cart))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              child: Image(
                                image: NetworkImage(
                                    product.thumbnail?.toString() ?? ""),
                                fit: BoxFit.contain,
                              ),
                              radius: 100,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Expanded(
                              child: ListView.separated(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (context, index) => Container(
                                        child: Image(
                                          image: NetworkImage(product
                                              .images![index]
                                              .toString()),
                                          fit: BoxFit.contain,
                                        ),
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            color: Colorconst.primary,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                      ),
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                        height: 20,
                                      ),
                                  itemCount: product.images!.length),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "\₹ ${product.price.toString()}",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w800,
                              color: Color(0xff2277db)),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          product.title ?? "",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff000000)),
                        ),
                        Text(
                          "About the item",
                          style: TextStyle(color: Colors.grey.withOpacity(.9)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              child: Textcard(textquote: "Full Specification"),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            InkWell(
                              child: Textcard(textquote: "Reviews"),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          product.description ?? "",
                          maxLines: 3,
                        )
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20))),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: InkWell(
                  child: Container(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            size: 30,
                            Icons.shopping_cart,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "ADD TO CART",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Color(0xff430857),
                        borderRadius: BorderRadius.circular(20)),
                    height: 60,
                    width: double.infinity,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              )
            ],
          ),
        );
      } else if (state is ProductDetailError) {
        return Center(child: Text("Error: ${state.error}")); // Error state
      } else {
        return Center(child: Text("Unknown state")); // Fallback
      }
    });
  }
}
