import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/common/utils/constants.dart';
import 'package:weather_app/common/widgets/appstyle.dart';
import 'package:weather_app/common/widgets/outlinebutton.dart';
import 'package:weather_app/common/widgets/reusabletext.dart';
import 'package:weather_app/common/widgets/textfield.dart';
import 'package:weather_app/core/blocs/weatherbloc/weather_bloc.dart';
import 'package:weather_app/core/pages/homeScreen/widgets/weather_loading.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(150),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                CustomeTextField(
                  hintText: "Enter Address",
                  controller: addressController,
                  suffixIcon: const Icon(
                    Icons.search,
                    size: 24,
                    color: AppConst.knavybluelightdark,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: CustomOutlineButton(
                      width: 80,
                      height: 50,
                      borradius: 15,
                      borcolor: AppConst.knavybluelightdark,
                      text: addressController.text == null ? "Update" : "Save",
                      textstyle: appstyle(
                          24, AppConst.knavybluelightdark, FontWeight.w600),
                      textheight: 40,
                      textwidth: 60,
                      ontap: () {
                        BlocProvider.of<WeatherBloc>(context).add(
                          WeatherUpdateEvent(addressController.text),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        body: BlocConsumer<WeatherBloc, WeatherState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is WeatherLoadingState) {
              return const WeatherLoadingSatae();
            }
            if (state is WeatherLoadedState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ReusableText(
                    text: state.weathermodel.current.condition.text,
                    textstyle: appstyle(
                      25,
                      AppConst.knavybluelightdark,
                      FontWeight.w600,
                    ),
                  ),
                  Container(
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
                      children: [
                        SizedBox(
                            height: 100,
                            width: 100,
                            child: Image.network(
                                "http:${state.weathermodel.current.condition.icon}")),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Table(
                            border: TableBorder.all(),
                            children: [
                              TableRow(
                                children: [
                                  const TableCell(
                                    child: Center(
                                      child: Text('Location'),
                                    ),
                                  ),
                                  TableCell(
                                    child: Center(
                                      child: Text(
                                          "${state.weathermodel.location.name},${state.weathermodel.location.country}"),
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  const TableCell(
                                    child: Center(
                                      child: Text('Temperature (*C)'),
                                    ),
                                  ),
                                  TableCell(
                                    child: Center(
                                      child: Text(
                                          '${state.weathermodel.current.tempC}'),
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  const TableCell(
                                    child: Center(
                                      child: Text('wind (Kph)'),
                                    ),
                                  ),
                                  TableCell(
                                    child: Center(
                                      child: Text(
                                          '${state.weathermodel.current.windKph}'),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
