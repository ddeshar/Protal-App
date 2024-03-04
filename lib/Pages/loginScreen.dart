import 'package:flutter_svg/svg.dart';

import 'package:flutter/material.dart';
import 'package:protal_app/Pages/homepage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  var email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  SvgPicture.asset('assets/exat.svg', height: 100),
                  // Image.asset(
                  //   'assets/user.png',
                  //   height: 100,
                  // ),
                  const SizedBox(height: 50.0),
                  TextFormField(
                    controller: _emailController,
                    onChanged: (value) {},
                    validator: (value) => validateEmail(value),
                    style: const TextStyle(
                      color: Colors.black,
                      letterSpacing: .25,
                      fontWeight: FontWeight.w500,
                    ),
                    obscureText: false,
                    maxLines: 1,
                    textAlign: TextAlign.left,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: "Email",
                        errorStyle: const TextStyle(
                          color: Colors.red,
                          wordSpacing: 5.0,
                        ),
                        labelStyle: const TextStyle(
                            color: Colors.green, letterSpacing: 1.3),
                        hintStyle: const TextStyle(letterSpacing: 1.3),
                        contentPadding:
                            const EdgeInsets.all(15.0), // Inside box padding
                        border: OutlineInputBorder(
                            gapPadding: 0.0,
                            borderRadius: BorderRadius.circular(20))),
                    onTap: (() {}),
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    controller: _passwordController,
                    onChanged: (value) {},
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your passsword ';
                      }
                      return null;
                    }),
                    style: const TextStyle(
                      color: Colors.black,
                      letterSpacing: .25,
                      fontWeight: FontWeight.w500,
                    ),
                    obscureText: true,
                    maxLines: 1,
                    textAlign: TextAlign.left,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: "Password",
                        errorStyle: const TextStyle(
                          color: Colors.red,
                          wordSpacing: 5.0,
                        ),
                        labelStyle: const TextStyle(
                            color: Colors.green, letterSpacing: 1.3),
                        hintStyle: const TextStyle(letterSpacing: 1.3),
                        contentPadding:
                            const EdgeInsets.all(15.0), // Inside box padding
                        border: OutlineInputBorder(
                            gapPadding: 0.0,
                            borderRadius: BorderRadius.circular(20))),
                    onTap: (() {}),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          email = _emailController.value.text;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Login SuccessFul $email'),
                            backgroundColor: Colors.green,
                            duration: const Duration(seconds: 3),
                          ),
                        );
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      } else {}
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 12.0),
                      child: Text('Login'),
                    ),
                  ),
                  TextButton(
                    onPressed: (() {}),
                    child: const Text(
                      'Forgot password?',
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                  TextButton(
                    onPressed: (() {}),
                    child: const Text('Not a member? Sign up now',
                        style: TextStyle(color: Colors.black54)),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email address';
    }
    // Use a regular expression for email validation
    String pattern = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null; // Return null if the input is valid
  }
}
