import 'package:flutter/material.dart';
import 'package:name/Screen2.dart';
import 'package:name/textfield.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Screen3 extends StatefulWidget {
  const Screen3({Key? key}) : super(key: key);

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
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
             Image(image: AssetImage('assets/search.png'),
          width:70.w,
          height: 20.h,
          )
              
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
              Textfield(text: 'Confirm Password',icon: Icons.visibility_off_rounded),
              SizedBox(height: 2.h,),
     
  SizedBox(height:5.h),
Container(
                    width: 28.w,
                    height: 8.h,
                     decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.sp),
                color: Color.fromARGB(255, 24, 34, 22),
              ),
                    
                    child: TextButton(onPressed: (){}, child: Text("Sign Up", textAlign: TextAlign.right,style: TextStyle(fontSize: 16.sp,color: Colors.grey,fontWeight: FontWeight.bold),),)
                  )

                  ],
                ),
              
               
            ],
        ),
      ),
    ),
        );
     
   
  }
}