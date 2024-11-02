import 'package:experelmachinetest/model/product_model.dart';
import 'package:flutter/material.dart';

class Itemcard extends StatelessWidget {
  final Product product;
  const Itemcard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: EdgeInsets.only(right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey.withOpacity(.5),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(product.images![0]),
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
    );
  }
}
