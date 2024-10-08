// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  TextEditingController tx = TextEditingController();
  var x = "";
  var email = "";
  final _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('App Bar'),
        ),
        body: Form(
          key: _loginFormKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.black),
                  hintText: 'Enter your Email',
                  prefixIcon: Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Icon(
                      Icons.email,
                      size: 23,
                      color: Colors.black,
                    ),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      color: Colors.green,
                      width: 2.0,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 2.0,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 2.0,
                    ),
                  ),
                  errorStyle: TextStyle(color: Colors.redAccent),
                ),
                style: TextStyle(color: Colors.black),
                validator: (val) => val!.isEmpty || val.length != 10
                    ? 'Enter a 10 Digit phone number' //Error Message
                    : null,
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
              ),
              Text(x),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                      padding: WidgetStateProperty.all<EdgeInsets>(
                          EdgeInsets.all(15)),
                      backgroundColor:
                          WidgetStateProperty.all<Color>(Colors.green),
                      shadowColor: WidgetStateProperty.all<Color>(Colors.grey),
                      elevation: WidgetStateProperty.resolveWith<double>(
                        (Set<WidgetState> states) {
                          if (states.contains(WidgetState.pressed)) return 10;
                          return 5; // default elevation
                        },
                      ),
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      animationDuration: Duration(milliseconds: 200)),
                  onPressed: () {
                    if (_loginFormKey.currentState!.validate()) {}
                    setState(() {
                      x = tx.text;
                    });
                  },
                  child: Text('Click'),
                ),
              )
            ],
          ),
        ));
  }
}
