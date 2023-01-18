import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/product_model.dart';
import '../pages/product_page.dart';
import '../theme.dart';

class ProductCard extends StatelessWidget {

   late ProductModel product;
  ProductCard(this.product);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductPage(product),
          ),
        );
      },
      child: Container(
        width: 215,
        height: 278,
        margin: EdgeInsets.only(
          left: 15,
          right: defaultMargin,
        ),
        decoration: BoxDecoration(
          color: Color(0xffECEDEF),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30,),
            Image.network(product.galleries[0].url,
            width: 215,
            height: 150,
            fit: BoxFit.cover,
            ),
            // Text('${product.galleries[0].id}'),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${product.category.name}',
                  style: secondaryTextStyle.copyWith(
                    fontSize: 12,
                  ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text('${product.name}',
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: semiBold,
                  ),
                  // overflow berfungsi jika namanya terlalu panjang dan melebihi maka akan mejadi titik
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text('\$'+'${product.price}',
                  style: priceTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: medium,
                  ),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}