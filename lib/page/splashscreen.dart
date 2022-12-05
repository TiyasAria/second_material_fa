import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:material_two_news_app/utils/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('asset/img/bg.png',  width: MediaQuery.of(context).size.width, fit: BoxFit.fill,),
          Center(child: Image.asset('asset/img/logo_berita.png'))
        ],
      ),
    );
  }

  //  cara yng pertama buat function untuk muncul selama berapa detinya
  splashScreen() async {
    var time = Duration(seconds: 3);
    return Timer(time, () {
      Navigator.pushReplacementNamed(context, mainPageRoute);
    });
  }
}
