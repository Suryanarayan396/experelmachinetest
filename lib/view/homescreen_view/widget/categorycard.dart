import 'package:experelmachinetest/model/product_model.dart';
import 'package:experelmachinetest/utils/widgets/textcard.dart';
import 'package:experelmachinetest/view/homescreen_view/widget/itemcard.dart';
import 'package:experelmachinetest/view/productscreen_view/productscreen_view.dart';
import 'package:flutter/material.dart';

class Categorycard extends StatelessWidget {
  final String title;
  final int itemcount;
  final List<Product> products;
  const Categorycard(
      {super.key,
      required this.title,
      required this.itemcount,
      required this.products});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Textcard(textquote: title),
          SizedBox(height: 10),
          Container(
            height: size.height * 0.30, // Fixed height for inner ListView
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: itemcount,
              itemBuilder: (context, itemIndex) {
                final product = products[itemIndex];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductscreenView(
                          productId: product.id!,
                        ),
                      ),
                    );
                  },
                  child: Itemcard(
                      product: product,
                      image: product.images![0],
                      description: product.description ?? ""),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
