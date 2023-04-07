import 'package:agri_easy/controller/global_controller.dart';
import 'package:agri_easy/screens/current_weather_widget.dart';
import 'package:agri_easy/widgets/daily_data_forecast.dart';
import 'package:agri_easy/widgets/header_widget.dart';
import 'package:agri_easy/widgets/hourly_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //call
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() => globalController.checkLoading().isTrue
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/icons/clouds.png",
                        height: 200, width: 200),
                    const CircularProgressIndicator(),
                  ],
                ))
            : Center(
                child: ListView(scrollDirection: Axis.vertical, children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const HeaderWidget(),
                  //for our current temperature
                  CurrentWeatherWidget(
                    weatherDataCurrent:
                        globalController.getWeatherData().getCurrentWeather(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //for our hourly temperature
                  HourlyDataWidget(
                    weatherDataHourly:
                        globalController.getWeatherData().getHourlyWeather(),
                  ),
                  DailyDataForecast(
                    weatherDataDaily:
                        globalController.getWeatherData().getDailyWeather(),
                  ),
                ]),
              )),
      ),
    );
  }
}
