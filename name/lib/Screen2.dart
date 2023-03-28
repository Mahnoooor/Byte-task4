import 'package:flutter/material.dart';
import 'package:name/screen1.dart';
import 'package:name/screen3.dart';
import 'package:name/textfield.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Screen2 extends StatelessWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
body: SingleChildScrollView(
  child:   Padding(
    padding: EdgeInsets.symmetric(horizontal: 7.w,vertical: 7.h),
    child: Column(
    children: [
      SizedBox(height:4.h),
      Center(child:
           Image(image: AssetImage('assets/search.png'),
        width: 70.w,
        height: 25.h,
        )
            
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
                color: Color.fromARGB(255, 24, 34, 22),
              ),
                    
                    child: TextButton(onPressed: (){Get.to(Screen3());}, child: Text("Sign Up", textAlign: TextAlign.right,style: TextStyle(fontSize: 16.sp,color: Colors.grey,fontWeight: FontWeight.bold),),)
                  )
                ],
              ),
            ),
    ],
      
    
    ),
  ),
),

    );
  }
}