import 'package:flutter/material.dart';
import 'package:hb_flutter/comp/line_chart.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome to LoanQuik",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Row(
                children: [
                  Expanded(child: LineChartSample2()),
                  Expanded(child: LineChartSample2()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
