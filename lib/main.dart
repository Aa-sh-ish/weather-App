import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/common/routes/router.dart';
import 'package:weather_app/common/utils/constants.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(375, 875),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather App',
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSeed(seedColor: AppConst.knavybluelightdark),
          useMaterial3: true,
        ),
        onGenerateRoute: Routes.onGenerateRoure,
        initialRoute: "/splashScreen",
      ),
    );
  }
}
