import 'dart:math';

import 'package:flutter/material.dart';
import 'package:name/Screen2.dart';
import 'package:name/screen3.dart';
import 'package:name/textfield.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> with TickerProviderStateMixin{
   late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return 
       Scaffold(
          backgroundColor: Colors.black,
    body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(7.h),
        child: Column(
            children: [
              SizedBox(height:3.h),
              Center(child:
          RotationTransition(
  turns: _animation,
  child: Image(
    image: AssetImage('assets/search.png'),
    width: 70.w,
    height: 20.h,
  ),
),

              
              ),
              SizedBox(
                height: 5.h,
              ),
             Column(
                  children: [
                    SizedBox(height: 4.h,),
                    Textfield(text: 'Name', icon: Icons.person,),
                    SizedBox(height: 3.h,),
              Textfield(text: 'Email address',icon: Icons.email),

              SizedBox(height:3.h),
              Textfield(text: 'Password',icon: Icons.visibility_off_rounded),
              SizedBox(height: 2.h,),
              Container(
                width: 70.w,
  alignment:Alignment.topRight,
  child:  TextButton(onPressed: (){},child: Text('Forget Password', textAlign: TextAlign.right,style: TextStyle(fontSize: 16.sp,color: Colors.white),))
),
  SizedBox(height:5.h),
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
  Text("Don't have an account", textAlign: TextAlign.right,style: TextStyle(fontSize: 16.sp,color: Colors.grey),),
  TextButton(onPressed: (){Get.to(Screen3());}, child: Text("Sign up", textAlign: TextAlign.right,style: TextStyle(fontSize: 16.sp,color: Colors.grey, fontWeight: FontWeight.bold),)),
    
  ],
),

                  ],
                ),
              
               
            ],
        ),
      ),
    ),
        );
     
   
  }
}