// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shoping_cart_app/login_page.dart';

import 'cart_bloc.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CartBloc>(
      
        create: (context) => CartBloc(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Shopping Cart Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home:LoginView(),
         
        ));
  }
}

