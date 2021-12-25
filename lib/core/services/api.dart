import 'package:flutter_shop/core/models/product.dart';
import 'package:flutter_shop/helpers/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class API {
  static const endpoint = URL.ProductList;

  var client = http.Client();

  Future<List<Product>> getProducts() async {
    var products = <Product>[];
    // ignore: unnecessary_string_interpolations, prefer_adjacent_string_concatenation
    var response = await client.get(Uri.parse('$endpoint' + 'products.json'));
    var data = json.decode(response.body) as List<dynamic>;
    for (var product in data) {
      products.add(Product.fromJson(product));
    }
    return products;
  }
}
