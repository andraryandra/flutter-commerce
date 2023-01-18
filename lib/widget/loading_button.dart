import 'package:flutter/material.dart';
import 'package:commerce_flutter/theme.dart';

class LoadingButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: TextButton(
          onPressed: (){},
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'Loading',
            style: TextStyle(
              fontSize: 16,
              fontWeight: medium,
              color: primaryTextColor,
            ),
          ),
        ),
      );
  }
}