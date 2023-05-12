import 'dart:math';

import 'package:flutter/material.dart';
import 'package:name/Screen2.dart';
import 'package:name/screen3.dart';
import 'package:name/screen4.dart';
import 'package:name/textfield.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
//login
class Screen1b extends StatefulWidget {
  const Screen1b({Key? key}) : super(key: key);

  @override
  State<Screen1b> createState() => _Screen1bState();
}

class _Screen1bState extends State<Screen1b> with TickerProviderStateMixin{
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
//

   final _formKey = GlobalKey<FormState>();
  final TextEditingController name=TextEditingController();
   final TextEditingController email=TextEditingController();
   final TextEditingController password=TextEditingController();
FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    _animationController.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }
  //logic function
  Future<void> loginUser(String email, String password) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
     
    );
    print('user logged in');
    Get.to(Post());
  } catch (e) {
    debugPrint(e.toString());
    print(e.toString());
      Get.snackbar(
      'Login failed',
      'Incorrect email or password',
      duration: Duration(seconds: 3),
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }
   
}


  //////////
  @override
  Widget build(BuildContext context) {
    return 
       Scaffold(
          backgroundColor:Color.fromARGB(148, 25, 51, 73),
    body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(7.h),
        child: Form(
          key: _formKey,
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
                      
                  

                    SizedBox(
                      height: 3.h,
                    ),

////email

                    TextFormField(
                      controller: email,
                      style: const TextStyle(color: Colors.white),
                             decoration: InputDecoration(
        hintText: 'Email',
        hintStyle:TextStyle(color:Colors.white),
        fillColor: Colors.white.withOpacity(0.2),
       filled: true,
       suffixIcon: Icon(Icons.email,color:  Colors.white.withOpacity(0.8)),
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
                      
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email';
                        } else if (!GetUtils.isEmail(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    
                    SizedBox(
                      height: 3.h,
                    ),

  //                   password
  //                   TextFormField(
  //                     controller: password,
  //                     style: const TextStyle(color: Colors.white),
  //                     obscureText: true,
  //                           decoration: InputDecoration(
  //       hintText: 'Password',
  //       hintStyle:TextStyle(color:Colors.white),
  //       fillColor: Colors.white.withOpacity(0.2),
  //      filled: true,
  //      suffixIcon: Icon(Icons.visibility_off_rounded,color:  Colors.white.withOpacity(0.8),),
  //  //TextStyle(fontSize: 20.0, color:Colors.white),
  //      focusedBorder:  OutlineInputBorder(
  //         borderSide:
  //               BorderSide(width: 2.sp, color: Colors.white), 
  //         borderRadius: BorderRadius.circular(15.sp),
  //      ),
  //       enabledBorder: OutlineInputBorder(
  //         borderSide:
  //               BorderSide(width: 1.sp, color: Colors.grey), 
  //         borderRadius: BorderRadius.circular(15.sp),
  //      )
  //     ),
  //                     validator: (value) {
  //                       if (value!.isEmpty) {
  //                         return 'Please enter your password';
  //                       } else if (value.length < 6) {
  //                         return 'Password should be at least 6 characters';
  //                       }
  //                       return null;
  //                     },
  //                   ),
        
              
        SizedBox(height: 2.h,),
        Container(
                      width: 35.w,
                      height: 7.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.sp),
                        color: Color.fromARGB(255, 42, 66, 75),
                      ),
                      child: TextButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                           var userEmail = email.text.trim();
    var userPassword = password.text.trim();
    await loginUser(userEmail, userPassword);
                          }
                        },
                        child: Center(
                          child: Text(
                            "Forget Password",
                           
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.white60,
                              fontWeight: FontWeight.bold,
                            ),
                                               
                          
                                            ),
                        ),)
                  )
                    ],
                  ),
                
                 
              ],
          ),
        ),
      ),
    ),
        );
     
   
  }
}





