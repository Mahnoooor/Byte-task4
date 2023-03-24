import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class Textfield extends StatelessWidget {
  final String text;
  final IconData icon;
  const Textfield({Key? key, required this.text, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      child: TextFormField(
          style: const TextStyle(color: Colors.white),//input text color
      decoration: InputDecoration(
        hintText: text,
        hintStyle:TextStyle(color:Colors.white),
        fillColor: Colors.white.withOpacity(0.2),
       filled: true,
       suffixIcon: Icon(icon),
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

 ),
    );
  }
}