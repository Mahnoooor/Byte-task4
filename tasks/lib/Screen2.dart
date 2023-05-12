import 'package:flutter/material.dart';
import 'package:name/screen1.dart';
import 'package:name/screen3.dart';
import 'package:name/textfield.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Screen2 extends StatefulWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> with TickerProviderStateMixin{
   late AnimationController _animationController1;
  late Animation<double> _animation1;
   late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    // Initializing the animation controller
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    _controller.repeat(); // Repeating the animation indefinitely

    // Creating the slide animation
    _animation = Tween<Offset>(
  
  begin: Offset(-1, 0),
  end: Offset(1, 0),
).animate(_controller);

//
    super.initState();
    _animationController1 = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
    _animation1 = Tween(begin: 0.0, end: 1.0).animate(_animationController1);

  }

  @override
  void dispose() {
    // Disposing the animation controller when the widget is removed from the tree
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
     
    return Scaffold(
     backgroundColor: Color.fromARGB(148, 25, 51, 73),
body: SingleChildScrollView(
  child:   Padding(
    padding: EdgeInsets.symmetric(horizontal: 7.w,vertical: 7.h),
    child: Column(
    children: [
      SizedBox(height:4.h),
      Center(child:
                 RotationTransition(
  turns: _animation1,
  child: Image(
    image: AssetImage('assets/search.png'),
    width: 70.w,
    height: 20.h,
  ),
),
            
            ),
            SizedBox(height: 4.h,),
            Text("Keep Track", textAlign: TextAlign.right,style: TextStyle(fontSize: 23.sp,color: Colors.white,fontFamily: 'Mulish',fontWeight: FontWeight.bold),),
            Text("Your Semester", textAlign: TextAlign.right,style: TextStyle(fontSize: 23.sp,color: Colors.white,fontWeight: FontWeight.bold),),
SizedBox(height: 1.h,),
            Container(
              alignment: Alignment.center,
              width: 50.w,
              height: 20.h,
             
              child:  Text("Track your semester activities, achieved goals and all information from here. It will help you to keep a check on your success and areas you need to work on! ", textAlign: TextAlign.center,style: TextStyle(fontSize: 16.sp,color: Colors.grey,fontFamily: 'Mulish-Light'),),
            ),
SizedBox(height: 4.h,),
            SlideTransition(
               position: _animation,
                child:
              Container(
              width: 56.w,
              height: 8.h,
             
              child: Row(
                children: [
                  Container(
                    width: 28.w,
                    height: 8.h,
                     decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10.sp),bottomLeft: Radius.circular(10.sp)),
                color: Colors.white,
              ),
                    
                    child: TextButton(onPressed: (){Get.to(Screen1());}, child: Text("Register", textAlign: TextAlign.right,style: TextStyle(fontSize: 16.sp,color: Colors.black,fontWeight: FontWeight.bold),),),
                  ),
                  Container(
                    width: 28.w,
                    height: 8.h,
                     decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(10.sp),bottomRight: Radius.circular(10.sp)),
                color: Color.fromARGB(255, 42, 66, 75)
              ),
                    
                    child: TextButton(onPressed: (){Get.to(Screen3());}, child: Text("Sign Up", textAlign: TextAlign.right,style: TextStyle(fontSize: 16.sp,color: Colors.grey,fontWeight: FontWeight.bold),),)
                  )
                ],
              ),
            ),
            )
    ],
      
    
    ),
  ),
),

    );
  }
}