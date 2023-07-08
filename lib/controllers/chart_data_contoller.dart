import 'package:iot_project/models/line_chart_model.dart';

class ChartDataController {
  List<LineChartModel> getChartData() {
    final List<LineChartModel> chartData = [
      LineChartModel(1,34),
      LineChartModel(2,35),
      LineChartModel(3,36),
      LineChartModel(4,37),
      LineChartModel(5,38),
      LineChartModel(6,33),
      LineChartModel(7,36),
      LineChartModel(7,37),
      LineChartModel(8,38),
      LineChartModel(9,39),
      LineChartModel(10,40),
      LineChartModel(11,41),
      LineChartModel(12,42),
      LineChartModel(13,43),
    ];

    return chartData;
  }
}