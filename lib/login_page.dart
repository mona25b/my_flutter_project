// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:shoping_cart_app/MyHomePage.dart';
import 'package:shoping_cart_app/cart_page.dart';
import 'bloc.dart';

class LoginView extends StatelessWidget {
  final bloc = Bloc();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  // ignore: non_constant_identifier_names
  ChangeThePage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => MyHomePage(
              title: 'Gift Shop',
            )));
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/login.png'), fit: BoxFit.cover)),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(children: [
              Container(
                padding: EdgeInsets.only(left: 35, top: 120),
                child: Text(
                  'welcome \n login page',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontStyle: FontStyle.italic),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.only(right: 35, left: 35),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      StreamBuilder<String>(
                          stream: bloc.email,
                          builder: (context, snapshot) {
                            return TextField(
                              controller: emailController,
                              onChanged: (s) => bloc.emailChanged.add(s),
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Enter Email",
                                  errorText: snapshot.error?.toString()),
                            );
                          }),
                      SizedBox(
                        height: 20,
                      ),
                      StreamBuilder(
                          stream: bloc.password,
                          builder: (context, snapshot) {
                            return TextField(
                              controller: passwordController,
                              onChanged: (s) => bloc.passwordChanged.add(s),
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Enter Pasword",
                                  labelText: "Password",
                                  errorText: snapshot.error?.toString()),
                            );
                          }),
                      SizedBox(
                        height: 20,
                      ),
                      StreamBuilder<bool>(
                          stream: bloc.submitCheck,
                          builder: (context, snapshot) {
                            return ElevatedButton(
                                onPressed: () {
                                  snapshot.hasData
                                      ? ChangeThePage(context)
                                      : null;
                                },
                                child: Text('Submit'));
                          }),
                      SizedBox(
                        height: 80,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              onPressed: () {
                                //  Navigator.of(context).push(MaterialPageRoute(
                                //builder: (context) => CartPage()));
                              },
                              child: Text(
                                'signup',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black45,
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.w600),
                              )),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                'forgot password',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black45,
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.w600),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ])));
  }
}
