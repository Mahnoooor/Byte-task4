import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:name/Screen2.dart';
import 'package:name/explore.dart';
import 'package:name/screen1.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
     return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return GetMaterialApp(
    home: explore(),
     
    );
      }
      );
      
  }
}
