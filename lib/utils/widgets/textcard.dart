import 'package:experelmachinetest/utils/constants/colorconst.dart';
import 'package:flutter/material.dart';

class Textcard extends StatelessWidget {
  final String textquote;
  const Textcard({super.key, required this.textquote});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      decoration: BoxDecoration(
          color: Colorconst.primarydark,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(15),
              topLeft: Radius.circular(15))),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            textquote,
            style: TextStyle(fontSize: 16, color: Colorconst.bwhite),
          ),
        ),
      ),
    );
  }
}
