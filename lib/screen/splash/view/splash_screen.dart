import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? animationControlle;
  Animation? img;

  @override
  void initState() {
    super.initState();
    animationControlle =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    img =Tween<double>(begin: 0,end: 1).animate(animationControlle!);
    animationControlle!.forward();
    animationControlle!.addListener(() {setState(() {});});
  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 5), () {Navigator.pushReplacementNamed(context, '/bottom');});
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff111113),
        body: Container(
          width: double.infinity,
          child: Stack(
            children: [
              Align(
                alignment: Alignment(0, 0),
                child: Opacity(
                  opacity: img!.value,
                  child: Image(image: AssetImage('assets/image/newlogopng.png'),
                      color: Colors.white.withOpacity(0.10),
                      height:80),
                ),
              ),
              Align(alignment: Alignment(0, .9),child: Container(width: 50.w,child: CircularProgressIndicator(color: Colors.white54,backgroundColor: Colors.transparent,))),
              Align(alignment: Alignment(0, 0.84),child: Text(" Wallet Manager",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20.sp,backgroundColor: Color(0xff111113)))),
            ],
          ),
        ),
      ),
    );
  }
}
