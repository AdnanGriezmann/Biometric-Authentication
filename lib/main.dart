import 'package:biometric_authtentication/App/Binding/Binding.dart';
import 'package:biometric_authtentication/App/View/Viewpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
          debugShowCheckedModeBanner: false, title: 'FingerPrint Auth',
          theme: ThemeData.dark(),
          initialRoute: '/view',
          getPages: [
            GetPage(name: '/view', page: ()=> ViewPage(),binding: Biometric()),
          ],
          
          
          );
    });
  }
}
