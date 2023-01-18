import 'package:commerce_flutter/theme.dart';
import 'package:commerce_flutter/widget/loading_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';

class SignInPage extends StatefulWidget {

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  TextEditingController emailController = TextEditingController(text: '');

  TextEditingController passwordController = TextEditingController(text: '');

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {

          AuthProvider authProvider = Provider.of<AuthProvider>(context);

  handleSignIn() async {

      setState(() {
        isLoading = true;
      });

      if (await authProvider.login(
        email: emailController.text,
        password: passwordController.text,
      )) {
        Navigator.pushNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: alertColor,
            content: Text(
              'Gagal Login',
              textAlign: TextAlign.center,
            ),
          ),
        );
      }
    }

          setState(() {
            isLoading = false;
          });

    Widget header(){
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Login',
            style: TextStyle(
              fontSize: 24,
              fontWeight: semiBold,
              color: primaryTextColor,
            ),
            ),
            SizedBox(
              height: 2,
            ),
            Text('Sign In to Cotinue', style: TextStyle(
              fontSize: 14,
              fontWeight: regular,
              color: subtitleTextColor,
            ),
            ),
          ],
        ),
      );
  }

    Widget emailInput(){
      return Container(
        margin: EdgeInsets.only(top: 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Email Address', style: TextStyle(
              fontSize: 16,
              fontWeight: medium,
              color: primaryTextColor,
            ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16
                ),
                decoration: BoxDecoration(
                  color: backgroundColor2,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Row(
                    children: [
                  Image.asset('assets/icon_email.png', width: 17,),
                  SizedBox(width: 16,),
                  Expanded(
                    child: TextFormField(
                      controller: emailController,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: light,
                        color: primaryTextColor,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Your Email Address',
                        hintStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: light,
                          color: subtitleTextColor,
                        ),
                      ),
                  ),
                  ),
                ],
                ),
                ),
            ),
          ],
        ),
      );
    }

    Widget passwordInput(){
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Password', style: TextStyle(
              fontSize: 16,
              fontWeight: medium,
              color: primaryTextColor,
            ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16
                ),
                decoration: BoxDecoration(
                  color: backgroundColor2,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Row(
                    children: [
                  Image.asset('assets/icon_password.png', width: 17,),
                  SizedBox(width: 16,),
                  Expanded(
                    child: TextFormField(
                      controller: passwordController,
                        obscureText: true,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: light,
                        color: primaryTextColor,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Your Password',
                        hintStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: light,
                          color: subtitleTextColor,
                        ),
                      ),
                  ),
                  ),
                ],
                ),
                ),
            ),
          ],
        ),
      );
    }

  Widget signInButton(){
    return Container(
      height: 50,
      width: double.infinity,
      margin: EdgeInsets.only(top: 30),
      child: TextButton(
        onPressed: handleSignIn,
        style: TextButton.styleFrom(
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text('Sign In', style: TextStyle(
          fontSize: 16,
          fontWeight: medium,
          color: primaryTextColor,
        ),
        ),
      ),
    );
  }

    Widget footer(){
      return Container(
        margin: EdgeInsets.only(bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Don\'t have an account? ', style: TextStyle(
              fontSize: 14,
              fontWeight: light,
              color: subtitleTextColor,
            ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, '/sign-up');
              },
              child: Text('Sign Up', 
              style: purpleTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: medium,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false, // Fungsinya menghilangkan tanda error pada tampilan
      backgroundColor: backgroundColor1,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              emailInput(),
              passwordInput(),
              isLoading ? LoadingButton() : signInButton(),
              Spacer(),
              footer(),
          ]),
        ),
      ),
    );
  }
}