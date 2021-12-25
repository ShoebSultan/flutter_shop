// TODO 2: Create MockAPI Class

import 'package:flutter_shop/core/models/product.dart';
import 'package:flutter_shop/core/services/api.dart';
import 'package:flutter_shop/core/viewmodels/product_list_model.dart';
import 'package:flutter_shop/helpers/dependency_assembly.dart';
import 'package:flutter_test/flutter_test.dart';

class MockAPI extends API {
  @override
  Future<List<Product>> getProducts() {
    return Future.value([
      Product(
          id: 1,
          name: "MacBook Pro 16-inch model",
          price: 2399,
          imageUrl: "imageUrl"),
      Product(id: 2, name: "AirPods Pro", price: 249, imageUrl: "imageUrl"),
    ]);
  }
}

// TODO 5: Declare a Mock Product

void main() {
  // TODO 3: Call Dependency Injector
  // 1
  setupDependencyAssembler();
  // 2
  var productListViewModel = dependencyAssembler<ProductListModel>();
  // 3
  productListViewModel.api = MockAPI();

  // TODO 6: Inject Cart View Model

  // TODO 4: Write Product List Page Test Cases

  group('Given product list page laods', () {
    test("Page should load a list of products from firebase", () async {
      await productListViewModel.getProducts();
      expect(productListViewModel.products.length, 2);
      expect(productListViewModel.products[0].name, 'MacBook Pro 16-inch model');
      expect(productListViewModel.products[0].price, 2399);
      expect(productListViewModel.products[1].name, 'AirPods Pro');
      expect(productListViewModel.products[1].price, 249);
    });
  });

  // TODO 7: Write Add to Cart Logic Test Case
}
