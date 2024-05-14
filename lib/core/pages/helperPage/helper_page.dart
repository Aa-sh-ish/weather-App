import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/common/utils/constants.dart';
import 'package:weather_app/common/widgets/appstyle.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:weather_app/common/widgets/outlinebutton.dart';
import 'package:weather_app/common/widgets/reusabletext.dart';

class HelperPage extends StatelessWidget {
  const HelperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FlutterSplashScreen.fadeIn(
          duration: const Duration(seconds: 5),
          animationDuration: const Duration(seconds: 2),
          backgroundColor: AppConst.knavypurplelight.withOpacity(0.1),
          onEnd: () {
            Navigator.popAndPushNamed(context, "/homeScreen");
          },
          childWidget: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/frame.png"), fit: BoxFit.fill)),
            child: Padding(
              padding: EdgeInsets.all(20.h),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 70.h),
                    child: ReusableText(
                      text: "We show weather for you",
                      textstyle: appstyle(
                          20, AppConst.knavybluelightdark, FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: SizedBox(
                      height: 300,
                      width: 300,
                      child: Image.asset(
                        "assets/logo.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 60.w),
                      child: CustomOutlineButton(
                        width: 100.w,
                        height: 50.h,
                        borradius: 15,
                        borcolor: AppConst.knavybluelightdark,
                        text: "Skip",
                        textstyle: appstyle(
                            20, AppConst.knavybluelightdark, FontWeight.w700),
                        textheight: 40.h,
                        textwidth: 60.h,
                        ontap: () {
                          Navigator.popAndPushNamed(context, "/homeScreen");
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
