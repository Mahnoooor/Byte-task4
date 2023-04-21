import 'package:flutter/material.dart';
import 'package:name/Screen2.dart';
import 'package:name/screen1.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class explore extends StatefulWidget {
  const explore({super.key});

  @override
  State<explore> createState() => _exploreState();
}

class _exploreState extends State<explore> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black,
              Colors.black54,
            ],
          ),
        ),
        child: Stack(
          children: [
            AnimatedSize(
              duration: Duration(seconds: 5),
              vsync: this,
              child: Container(
                height: double.infinity,
                child: Image(
                  image: AssetImage('assets/search.png'),
                ),
              ),
            ),
            Positioned(
  bottom: 20,
  right: 20,
  child: GestureDetector(
    onTap: () {
      Get.to(Screen2());
    },
    child: Container(
      width: 50.sp,
      height: 35.sp,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.sp),
        color: Colors.black87
      ),
      child: TextButton(
       
        child: Text('Lets go!', style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          fontSize: 21.sp,
                          fontWeight: FontWeight.w800,color: Colors.white70))),
        onPressed: null,
      ),
    ),
  ),
),

          ],
        ),
      ),
    );
  }
}
