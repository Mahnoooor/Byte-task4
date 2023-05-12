import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:name/Screen2.dart';
import 'package:name/explore.dart';
import 'package:name/screen1.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:name/screen1b.dart';
import 'package:name/screen3.dart';
import 'package:name/screen4.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'screen5.dart';

void main() async {
     WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
     return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return  GetMaterialApp(
    home: explore(),
     
    );
      }
      );
      
  }
}
