import 'package:statszone/core/app_core.dart';
import 'package:statszone/presentation/widgets/charts/spider_chart.dart';

class CustomSpiderChart extends StatelessWidget {
  final List<double> playerAttributes;
  const CustomSpiderChart({
    super.key, 
    required this.playerAttributes});

  @override
  Widget build(BuildContext context) {
    final List<double> attributes = playerAttributes;

    final List<SpiderChartData> data = attributes
        .asMap()
        .map((index, value) => MapEntry(
            index,
            SpiderChartData(
              value: value,
              label: PlayerAttributes.values[index].title,
              color: value.color,
            )))
        .values
        .toList();
    return Center(
      child: AspectRatio(
        aspectRatio: 1.9,
        child: SpiderChart(
          data: data.map((d) => d.value).toList(),
          maxValue: 100,
          colors: data.map((d) => d.color).toList(),
          labels: data.map((d) => d.label).toList(),
          colorSwatch: Colors.amber,
        ),
      ),
    );
  }
}

class SpiderChartData {
  final double value;
  final String label;
  final Color color;

  SpiderChartData(
      {required this.value, required this.label, required this.color});
}
