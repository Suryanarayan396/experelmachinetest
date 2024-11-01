import 'package:flutter/material.dart';

class ProductscreenView extends StatelessWidget {
  const ProductscreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: InkWell(
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3), // Shadow color
                offset: Offset(4, 4), // Shadow position
                blurRadius: 10, // Softness of the shadow
                spreadRadius: 1, // Size of the shadow
              )
            ]),
            child: Center(
              child: Icon(Icons.arrow_back_ios_new),
            ),
          ),
        ),
        actions: [
          InkWell(
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3), // Shadow color
                  offset: Offset(4, 4), // Shadow position
                  blurRadius: 10, // Softness of the shadow
                  spreadRadius: 1, // Size of the shadow
                )
              ]),
              child: Center(
                child: Icon(Icons.shopping_cart),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
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
                    Row(
                      children: [
                        Spacer(),
                        CircleAvatar(
                          child: Image(
                            image: NetworkImage("url"),
                            fit: BoxFit.fill,
                          ),
                          radius: 100,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Column(
                          children: [
                            Container(
                              child: Image(
                                image: NetworkImage("url"),
                                fit: BoxFit.fill,
                              ),
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Color(0xff430857),
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              child: Image(
                                image: NetworkImage("url"),
                                fit: BoxFit.fill,
                              ),
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Color(0xff430857),
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              child: Image(
                                image: NetworkImage("url"),
                                fit: BoxFit.fill,
                              ),
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Color(0xff430857),
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 30,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "data",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          color: Color(0xff2277db)),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "data",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff000000)),
                    ),
                    Text(
                      "About the item",
                      style: TextStyle(color: Colors.grey.withOpacity(.9)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          child: Container(
                            height: 30,
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(.5)),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Full Specification"),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          child: Container(
                            height: 30,
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(.5)),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Reviews"),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "data",
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
  }
}
