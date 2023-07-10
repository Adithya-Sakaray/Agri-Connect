import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iot_project/components/rain_container.dart';
import 'package:iot_project/components/sensor_container.dart';
import 'package:iot_project/controllers/weather_controller.dart';
import 'package:iot_project/models/line_chart_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../controllers/chart_data_contoller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<LineChartModel> chartValues = chartDataController.getChartData();
  final WeatherController weatherController = Get.put(WeatherController());
  final ChartDataController chartDataController = ChartDataController();

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   chartValues = chartDataController.getChartData();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .background,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "AgriConnect",
          style: TextStyle(fontSize: 25, color: Theme
              .of(context)
              .colorScheme
              .secondary, fontWeight: FontWeight.w800),
        ),
      ),
      backgroundColor: Theme
          .of(context)
          .colorScheme
          .background,
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const SizedBox(width: 22,),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10.0, top: 5.0, bottom: 10.0),
                      child: Obx((){return SensorContainer(
                          value: "${weatherController.temperature} °C",
                          type: "Temperature",
                        );}
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10.0, top: 5.0, bottom: 10.0),
                      child: Obx((){return SensorContainer(
                          value: "${weatherController.humidity} %",
                          type: "Humidity",
                        );}
              
                        ),
                      ),
              
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(width: 22,),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Obx(() {
                        return SensorContainer(
                          value: "${weatherController.rain}%",
                          type: "Chance of\n\t\t\t\t\tRain",
                        );
                      }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Obx((){return RainContainer(
                          value: weatherController.isRaining.value,
                        );}
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: 400,
                    decoration: BoxDecoration(
                      color: Theme
                          .of(context)
                          .colorScheme
                          .secondary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SfCartesianChart(
                        title: ChartTitle(text: "Soil Moisture", textStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w800),),
                        series: <ChartSeries>[
                          LineSeries<LineChartModel, int>(
                              width: 4,
                              color: Colors.teal.shade400,
                              dataSource: chartValues,
                              xValueMapper: (LineChartModel data, _) => data.x,
                              yValueMapper: (LineChartModel data, _) => data.y)
                        ],
                        primaryXAxis: NumericAxis(
                          edgeLabelPlacement: EdgeLabelPlacement.shift,
                          majorGridLines: const MajorGridLines(width: 0),
                          minorGridLines: const MinorGridLines(width: 0),
                          isVisible: false,
                        ),
                        primaryYAxis: NumericAxis(
                          // borderColor: Colors.white,
                          edgeLabelPlacement: EdgeLabelPlacement.shift,
                          majorGridLines: const MajorGridLines(width: 0),
                          minorGridLines: const MinorGridLines(width: 0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
          ),);
  }
}
