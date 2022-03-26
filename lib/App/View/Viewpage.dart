import 'package:biometric_authtentication/App/Controller/Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ViewPage extends StatelessWidget {
  ViewPage({Key? key}) : super(key: key);
  final controller = Get.find<ViewPageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Biometric Flutter'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(15.0.sp),
            color: Colors.transparent,
            child: Text(
              'Biometric',
              style: TextStyle(fontSize: 13.0.sp, fontWeight: FontWeight.bold,),
            ),
          ),
          SizedBox(height: 1.0.h),
          Container(
            margin: EdgeInsets.only(left: 12.0.sp, right: 12.0.sp),
            child: Row(
              children: [
                Obx(() => controller.hasFingerPrint.value
                    ? Icon(
                        Icons.check,
                        color: Colors.green,
                      )
                    : Icon(
                        Icons.clear,
                        color: Colors.red,
                      )),
                SizedBox(
                  width: 6.0.sp,
                ),
                Text(
                  'Finger Print Authentication',
                  style:
                      TextStyle(fontSize: 16.0.sp, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          SizedBox(height: 6.0.sp),
          Container(
            margin: EdgeInsets.only(left: 12.0.sp, right: 12.0.sp),
            child: Row(
              children: [
                Obx(() => controller.hasFaceLock.value
                    ? Icon(
                        Icons.check,
                        color: Colors.green,
                      )
                    : Icon(
                        Icons.clear,
                        color: Colors.red,
                      )),
                SizedBox(
                  width: 6.0.sp,
                ),
                Text(
                  'Face Authentication',
                  style:
                      TextStyle(fontSize: 16.0.sp, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.0.sp),
          Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  controller.authenticationUser();
                },
                child: Text('Authenticate'),
              )
            ],
          )
        ],
      ),
    );
  }
}
