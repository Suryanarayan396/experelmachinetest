import 'package:experelmachinetest/utils/constants/colorconst.dart';
import 'package:experelmachinetest/model/product_model.dart';
import 'package:flutter/material.dart';

class Itemcard extends StatelessWidget {
  final Product product;
  final String image;
  final String description;

  const Itemcard(
      {super.key,
      required this.product,
      required this.image,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colorconst.primarydark.withOpacity(.5),
          borderRadius: BorderRadius.circular(20)),
      width: 170,
      margin: EdgeInsets.only(right: 10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 130,
              width: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colorconst.bwhite,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(image),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              product.title ?? "",
              style: TextStyle(
                  color: Colorconst.bwhite,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              description,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colorconst.bwhite, fontSize: 12),
            ),
            Text(
              '\₹  ${product.price}',
              style: TextStyle(color: Colorconst.bwhite, fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}
