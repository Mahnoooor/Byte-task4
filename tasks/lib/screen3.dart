import 'dart:math';

import 'package:flutter/material.dart';
import 'package:name/Screen2.dart';
import 'package:name/screen1.dart';
import 'package:name/textfield.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'screen4.dart';
//sign upp
class Screen3 extends StatefulWidget {
  const Screen3({Key? key}) : super(key: key);

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(148, 25, 51, 73),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(7.h),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 3.h),
                Center(
                  child: Image(
                    image: AssetImage('assets/search.png'),
                    width: 70.w,
                    height: 20.h,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 4.h,
                    ),

                    //namee
                    Formfields(text: 'Name', icon: Icons.person, controller: name,  
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },),

                    SizedBox(
                      height: 3.h,
                    ),

////email
                    
Formfields(text: 'email', icon: Icons.email, controller:email, validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email';
                        } else if (!GetUtils.isEmail(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },),
                    
                    SizedBox(
                      height: 3.h,
                    ),

                    //password
                    
                      Formfields(text: 'Password', icon: Icons.visibility_off_rounded, controller: password,validator:(value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        } else if (value.length < 6) {
                          return 'Password should be at least 6 characters';
                        }
                        return null;
                      },),

                    SizedBox(
                      height: 2.h,
                    ),

                  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text("Already have an account", textAlign: TextAlign.right,style: TextStyle(fontSize: 16.sp,color: Colors.grey),),
          TextButton(onPressed: (){Get.to(Screen1());}, child: Text("LogIn", textAlign: TextAlign.right,style: TextStyle(fontSize: 16.sp,color: Colors.grey, fontWeight: FontWeight.bold),)),
            
          ],
        ),
                    SizedBox(
                      height: 2.h,
                    ),

                    //sign upp
                    Container(
                      width: 26.w,
                      height: 7.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.sp),
                        color: Color.fromARGB(255, 42, 66, 75),
                      ),
                      child: TextButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            var UserName = name.text.trim();
                            var UserEmail = email.text.trim();
                            var UserPassword = password.text.trim();

                            try {
                              await _auth.createUserWithEmailAndPassword(
                                email: UserEmail,
                                password: UserPassword,
                              ).then((value) {
                                print('user created');
                                Get.to(Post());
                              });
                            } catch (e) {
                              print(e.toString());
                            }
                          }
                        },
                        child: Text(
                          "Sign Up",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                       
                        
                    ),)
                  )

                  ],
                ),
              
               
            ],
        ),
      ),
    ),
      )
        );
     
   
  }
}

class Formfields extends StatelessWidget {
     final String text;
  final IconData icon;
final Function(String)? validator;
  const Formfields({
    super.key,
    required this.text, required this.icon, this.validator, required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
        hintText: text,
        hintStyle:TextStyle(color:Colors.white),
        fillColor: Colors.white.withOpacity(0.2),
       filled: true,
       suffixIcon: Icon(icon,color:  Colors.white.withOpacity(0.8),),
   //TextStyle(fontSize: 20.0, color:Colors.white),
       focusedBorder:  OutlineInputBorder(
          borderSide:
                BorderSide(width: 2.sp, color: Colors.white), 
          borderRadius: BorderRadius.circular(15.sp),
       ),
        enabledBorder: OutlineInputBorder(
          borderSide:
                BorderSide(width: 1.sp, color: Colors.grey), 
          borderRadius: BorderRadius.circular(15.sp),
       )
      ),
    
    );
  }
}
