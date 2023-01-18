import 'package:commerce_flutter/models/product_model.dart';
import 'package:commerce_flutter/widget/product_card.dart';
import 'package:flutter/cupertino.dart';

class WishlistProvider with ChangeNotifier{

  List<ProductModel> _wishlist = [];

  List<ProductModel> get wishlist => _wishlist;

  set wishlist(List<ProductModel> wishlist){
    _wishlist = wishlist;
    notifyListeners();
  } 

  setProduct(ProductModel product){

    if(!isWishlist(product)){
      _wishlist.add(product);
    } else {
      _wishlist.removeWhere((element) => element.id == product.id);
    }

  notifyListeners();
  }

  isWishlist(ProductModel product){

    if(wishlist.indexWhere((element) => element.id == product.id) == -1){
      return false;
    } else {
      return true;
    }

  }



}