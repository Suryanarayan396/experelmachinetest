import 'dart:convert';

import 'package:experelmachinetest/model/product_model.dart';
import 'package:http/http.dart' as http;

class Apiservice {
  Future<List<Product>?> fetchdata() async {
    List<Product>? product = [];

    final url = Uri.parse("https://dummyjson.com/products");
    var resp = await http.get(url);
    if (resp.statusCode == 200) {
      var json = jsonDecode(resp.body);
      var data = Allproductmodel.fromJson(json);
      product = data.products;
      return product;
    } else {
      return null;
    }
  }

// Future<List<Allproductmodel>?> fetchproducts() async {
//     List<Product>? products = [];

//     final url = Uri.parse("https://dummyjson.com/products");
//     var resp = await http.get(url);
//     if (resp.statusCode == 200) {
//       var json = jsonDecode(resp.body);
//       var data = Allproductmodel.fromJson(json);
//       products = data.products;
//       return products;
//     } else {
//       return null;
//     }
//   }
  Future<Product> fetchProductById(int id) async {
    final response =
        await http.get(Uri.parse('https://dummyjson.com/products/$id'));

    if (response.statusCode == 200) {
      return Product.fromRawJson(response.body);
    } else {
      throw Exception('Failed to load product details');
    }
  }
}
