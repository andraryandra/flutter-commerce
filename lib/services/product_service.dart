import 'dart:convert';
import 'package:commerce_flutter/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductService{

  static const String baseUrl = 'http://192.168.43.246:8000/api';
  // static const String baseUrl = 'http://192.168.43.246:8000/api';
  // String baseUrl = 'http://127.0.0.1:8000/api';
  // String baseUrl = 'http://10.0.2.2/api';

  Future<List<ProductModel>> getProducts() async {

    // var url = Uri.parse('$baseUrl/products');
    var url = Uri.parse("$baseUrl/products");
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(url, headers: headers);
    
    print(response.body);

    if(response.statusCode == 200){

      List data = jsonDecode(response.body)['data']['data'];
      List<ProductModel> products = [];

      for(var item in data){
        products.add(ProductModel.fromJson(item));
      }

      return products;
    } else {
      throw Exception('Gagal Get Products!');
    }

  }


}