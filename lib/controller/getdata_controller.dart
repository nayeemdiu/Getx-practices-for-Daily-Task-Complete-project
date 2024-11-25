// product_controller.dart
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/getdata_model.dart';

class ProductController extends GetxController {
  var productList = <Product>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
      if (response.statusCode == 200) {
        var products = jsonDecode(response.body) as List;
        productList.value = products.map((product) => Product.fromJson(product)).toList();
      } else {
        Get.snackbar('Error', 'Failed to fetch products');
      }
    } finally {
      isLoading(false);
    }
  }
}
