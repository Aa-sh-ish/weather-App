import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/common/utils/constants.dart';
import 'package:weather_app/common/widgets/appstyle.dart';
import 'package:weather_app/common/widgets/heightspacer.dart';
import 'package:weather_app/common/widgets/reusabletext.dart';
import 'package:weather_app/common/widgets/shimmerror.dart';

class WeatherLoadingSatae extends StatelessWidget {
  const WeatherLoadingSatae({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          height: 400.h,
          width: 300.w,
          decoration: BoxDecoration(
              color: AppConst.kLight,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                  color: AppConst.knavypurplelight,
                  blurRadius: 3,
                  spreadRadius: 5,
                )
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircularProgressIndicator(),
              const HeightSpace(height: 20),
              ShimmerError(
                  respose: ReusableText(
                      text: "Fetching Data",
                      textstyle:
                          appstyle(20, AppConst.kGreen, FontWeight.w700)),
                  basecolor: AppConst.kGreyLight,
                  highlightcolor: AppConst.kred),
            ],
          )),
    );
  }
}
