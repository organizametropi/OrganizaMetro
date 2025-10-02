import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';

class pieChart extends StatefulWidget{
  pieChart({super.key}); 

  @override
  _pieChartState createState() => _pieChartState();

}

class _pieChartState extends State<pieChart>{
  //param

  @override
  Widget build(BuildContext context){
    return PieChart(
      PieChartData(

      )
    );
  }
}