import 'dart:convert';

import 'package:experelmachinetest/model/product_model.dart';
import 'package:experelmachinetest/model/singleproduct_model.dart';
import 'package:http/http.dart' as http;

class Apiservice {
  Singleproductmodel? productobj;
  bool isloading = false;
  final String baseUrl = 'https://dummyjson.com';

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products'));

    if (response.statusCode == 200) {
      List products = json.decode(response.body)['products'];
      return products.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<void> getproductdetail({required int id}) async {
    isloading = true;

    final url = Uri.parse("https://dummyjson.com/products/$id");
    var res = await http.get(url);
    if (res.statusCode == 200) {
      var jsonata = json.decode(res.body);
      productobj = Singleproductmodel.fromJson(jsonata);
    }
    isloading = false;
  }
}
