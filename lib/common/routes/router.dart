import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/blocs/weatherbloc/weather_bloc.dart';
import 'package:weather_app/core/pages/helperPage/helper_page.dart';
import 'package:weather_app/core/pages/homeScreen/home_screen.dart';

class Routes {
  static Route? onGenerateRoure(RouteSettings settings) {
    switch (settings.name) {
      case "/splashScreen":
        return MaterialPageRoute(builder: (context) => const HelperPage());

      case "/homeScreen":
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => WeatherBloc(),
                  child: HomeScreen(),
                ));
    }
    return null;
  }
}
