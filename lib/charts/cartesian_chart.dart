import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../models/expense_data_model.dart';

class CartesianChart extends StatefulWidget {
  const CartesianChart({super.key});

  @override
  State<CartesianChart> createState() => _CartesianChartState();
}

class _CartesianChartState extends State<CartesianChart> {
  late List<ExpanseDataModel> _chartData;
  late TooltipBehavior _tooltipBehavior;

  List<ExpanseDataModel> getChartData() {
    final List<ExpanseDataModel> chartData = [
      const ExpanseDataModel(
          expenseCategory: 'Food',
          father: 55,
          mother: 40,
          daughter: 45,
          son: 48),
      const ExpanseDataModel(
          expenseCategory: 'Transport',
          father: 33,
          mother: 45,
          daughter: 54,
          son: 28),
      const ExpanseDataModel(
          expenseCategory: 'Medical',
          father: 43,
          mother: 23,
          daughter: 20,
          son: 34),
      const ExpanseDataModel(
          expenseCategory: 'Clothes',
          father: 32,
          mother: 54,
          daughter: 23,
          son: 54),
      const ExpanseDataModel(
          expenseCategory: 'Books',
          father: 56,
          mother: 18,
          daughter: 43,
          son: 55),
      const ExpanseDataModel(
          expenseCategory: 'Others',
          father: 23,
          mother: 54,
          daughter: 33,
          son: 56),
    ];
    return chartData;
  }

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      title:
          ChartTitle(text: 'Monthly expenses of a family \n (in U.S. Dollars)'),
      legend: Legend(isVisible: true),
      tooltipBehavior: _tooltipBehavior,
      series: <ChartSeries>[
        StackedArea100Series<ExpanseDataModel, String>(
          dataSource: _chartData,
          xValueMapper: (ExpanseDataModel exp, _) => exp.expenseCategory,
          yValueMapper: (ExpanseDataModel exp, _) => exp.father,
          name: 'Father',
          markerSettings: const MarkerSettings(
            isVisible: true,
          ),
        ),
        StackedArea100Series<ExpanseDataModel, String>(
          dataSource: _chartData,
          xValueMapper: (ExpanseDataModel exp, _) => exp.expenseCategory,
          yValueMapper: (ExpanseDataModel exp, _) => exp.mother,
          name: 'Mother',
          markerSettings: const MarkerSettings(
            isVisible: true,
          ),
        ),
        StackedArea100Series<ExpanseDataModel, String>(
          dataSource: _chartData,
          xValueMapper: (ExpanseDataModel exp, _) => exp.expenseCategory,
          yValueMapper: (ExpanseDataModel exp, _) => exp.son,
          name: 'Son',
          markerSettings: const MarkerSettings(
            isVisible: true,
          ),
        ),
        StackedArea100Series<ExpanseDataModel, String>(
          dataSource: _chartData,
          xValueMapper: (ExpanseDataModel exp, _) => exp.expenseCategory,
          yValueMapper: (ExpanseDataModel exp, _) => exp.daughter,
          name: 'Daughter',
          markerSettings: const MarkerSettings(
            isVisible: true,
          ),
        ),
      ],
      primaryXAxis: CategoryAxis(),
    );
  }
}
