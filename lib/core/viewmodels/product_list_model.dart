import 'package:flutter_shop/core/enums/view_state.dart';
import 'package:flutter_shop/core/models/product.dart';
import 'package:flutter_shop/core/services/api.dart';
import 'package:flutter_shop/core/viewmodels/base_model.dart';
import 'package:flutter_shop/helpers/dependency_assembly.dart';

class ProductListModel extends BaseModel {
  API api = dependencyAssembler<API>();

  late List<Product> _products;

  List<Product> get products {
    return _products;
  }

  Future getProducts() async {
    applyState(ViewState.busy);
    _products = await api.getProducts();
    applyState(ViewState.idle);
  }
}
