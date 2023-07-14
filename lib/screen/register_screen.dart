// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sneaker_shop/screen/home_page.dart';

import '../widgets/button.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _conpasswordController = TextEditingController();
  final _unfocusedColor = Colors.grey[600];
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _conpasswordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _emailFocusNode.addListener(() {
      setState(() {
        //Redraw so that the email label reflects the focus state
      });
    });
    _passwordFocusNode.addListener(() {
      setState(() {
        //Redraw so that the password label reflects the focus state
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          title: const Text(
            "Create your Account",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            children: <Widget>[
              const SizedBox(height: 80.0),
              Column(
                children: <Widget>[
                  Image.asset('lib/images/logo.png',
                      fit: BoxFit.contain, height: 100, width: 200),
                  const SizedBox(height: 20.0),
                  Text(
                    'Nike Store',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ],
              ),
              const SizedBox(height: 50.0),
              //email
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'email',
                  labelStyle: TextStyle(
                      color: _emailFocusNode.hasFocus
                          ? Colors.black
                          : _unfocusedColor),
                ),
                focusNode: _emailFocusNode,
              ),
              //spacer
              const SizedBox(height: 12.0),
              //Password
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                      color: _passwordFocusNode.hasFocus
                          ? Colors.black
                          : _unfocusedColor),
                ),
                obscureText: true,
                focusNode: _passwordFocusNode,
              ),
              const SizedBox(height: 12.0),
              //Password
              TextField(
                controller: _conpasswordController,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  labelStyle: TextStyle(
                      color: _conpasswordFocusNode.hasFocus
                          ? Colors.black
                          : _unfocusedColor),
                ),
                obscureText: true,
                focusNode: _conpasswordFocusNode,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all<Size>(
                        Size(200, 50)), // Atur ukuran minimum tombol
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            30), // Atur bentuk bulat dengan radius 30
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.black), // Atur warna latar belakang tombol
                  ),
                  onPressed: () => register(),
                  child: const Text("Register"),
                ),
              ),

              //Button bar
            ],
          ),
        ));
  }

  register() async {
    if (_passwordController.text == _conpasswordController.text) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        Future.delayed(const Duration(seconds: 3)).then(
          (value) => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
            (route) => false,
          ),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
    } else {
      print("Password and confirmation password not match");
    }
  }
}
