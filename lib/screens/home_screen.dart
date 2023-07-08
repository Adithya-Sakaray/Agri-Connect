import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  late List<LineChartModel> chartValues;
  TooltipBehavior _tooltipBehavior = TooltipBehavior(enable: true);
  final WeatherController weatherController = Get.put(WeatherController());
  final ChartDataController chartDataController = ChartDataController();

  @override
  void initState() {
    // TODO: implement initState
    chartValues = chartDataController.getChartData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        title: const Text(
          "Agri-Connect",
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SensorContainer(
                      value: "35 °C",
                      type: "Temperature",
                      isLoading: false.obs,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SensorContainer(
                      value: "40",
                      type: "Humidity",
                      isLoading: false.obs,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SensorContainer(
                      value: "${weatherController.rain}%",
                      type: "Chance of\n\t\t\t\t\tRain",
                      isLoading: weatherController.isLoading,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SensorContainer(
                      value: "40",
                      type: "Soil Moisture",
                      isLoading: false.obs,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: 400,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SfCartesianChart(
                      title: ChartTitle(text: "Soil Moisture"),
                      series: <ChartSeries>[
                        LineSeries<LineChartModel, int>(
                            width: 4,
                            color: Theme.of(context).colorScheme.error,
                            dataSource: chartValues,
                            xValueMapper: (LineChartModel data, _) => data.x,
                            yValueMapper: (LineChartModel data, _) => data.y)
                      ],
                      primaryXAxis: NumericAxis(
                        edgeLabelPlacement: EdgeLabelPlacement.shift,
                        majorGridLines: MajorGridLines(width: 0),
                        minorGridLines: MinorGridLines(width: 0),
                        isVisible: false,
                      ),
                      primaryYAxis: NumericAxis(
                        edgeLabelPlacement: EdgeLabelPlacement.shift,
                        majorGridLines: MajorGridLines(width: 0),
                        minorGridLines: MinorGridLines(width: 0),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
