import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testflutter_application_1/pages/homepage.dart';
import 'package:testflutter_application_1/pages/register/registerPage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void _showErrodialog(String errorMessage) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('login error'),
            content: Text(errorMessage),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              )
            ],
          );
        });
  }

  Future<void> login() async {
    final auth = FirebaseAuth.instance;
    try {
      final UserCredential userCredential =
          await auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HomePage()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // Email tidak ditemukan
        _showErrodialog('Email tidak ditemukan. Silakan periksa kembali.');
      } else if (e.code == 'wrong-password') {
        // Password salah
        _showErrodialog('Password salah. Silakan periksa kembali.');
      } else {
        // Kesalahan lainnya
        _showErrodialog('Email atau password salah');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff392A27),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.0),
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white, // Warna latar belakang putih
            borderRadius: BorderRadius.circular(10.0), // Sudut melengkung
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4), // Efek bayangan
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset(
                'image/recipe_book.png',
                width: 100,
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              SizedBox(height: 30),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  if (emailController.text.isNotEmpty &&
                      passwordController.text.length > 6) {
                    login();
                  } else {
                    debugPrint('LOG: Email or Password is Invalid');
                    _showErrodialog('Email atau Password Invalid');
                  }
                }, // Memanggil fungsi login saat tombol ditekan
                child: Text('Login'),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => RegisterPage()));
                },
                child: Text('Register'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('test'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
