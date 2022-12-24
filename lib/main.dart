import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts_examples/charts/stacked_area_chart.dart';

import 'charts/cartesian_chart.dart';

void main() {
  runApp(const Root());
}

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MainScreen());
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SyncFusion Charts"),
      ),
      // ignore: prefer_const_constructors
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: const [CartesianChart(), StackedAreaChart()],
        ),
      ),
    );
  }
}
