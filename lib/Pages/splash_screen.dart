// Import flutter_svg package
import 'package:flutter_svg/svg.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:protal_app/Pages/loginScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initstate
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initScreen(context),
    );
  }

  startTime() async {
    var duration = const Duration(seconds: 6);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  initScreen(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 255, 204, 64),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Use SvgPicture.asset instead of Image.asset for SVG files
              SvgPicture.asset('assets/exat.svg', height: 200),
              // Image.asset('assets/icon.png', height: 200),
              const Padding(padding: EdgeInsets.only(top: 20.0)),
              const Text(
                "IT Department",
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
              const Padding(padding: EdgeInsets.only(top: 20.0)),
              const CircularProgressIndicator(
                backgroundColor: Colors.white,
                strokeWidth: 1,
              )
            ],
          ),
        ),
      ),
    );
  }
}
