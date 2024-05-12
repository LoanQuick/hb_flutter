import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        GaugeWIdget(),
        Text(
          'Monthly Financial Health',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 12.0,
        ),
        StackWidget(data: [50, 100, 150, 200, 250, 120]),
        SizedBox(
          height: 20.0,
        ),
        Text(
          'Calculate Loan EMI',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class GaugeWIdget extends StatelessWidget {
  const GaugeWIdget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        const Text("Poor"),
        const SizedBox(
          width: 8,
        ),
        Column(
          children: [
            const Text("Good"),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 200,
              width: 200,
              child: SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                    minimum: 0,
                    maximum: 300,
                    radiusFactor: 1.1,
                    maximumLabels: 0,
                    showFirstLabel: false,
                    labelOffset: 0,
                    labelsPosition: ElementsPosition.outside,
                    ranges: <GaugeRange>[
                      GaugeRange(
                        startValue: 0,
                        endValue: 100,
                        // color: Colors.red,
                        gradient: const SweepGradient(
                          colors: [
                            Colors.red,
                            Colors.red,
                            Colors.orange,
                          ],
                        ),
                        startWidth: 30,
                        endWidth: 30,
                      ),
                      GaugeRange(
                        startValue: 100,
                        endValue: 200,
                        gradient: const SweepGradient(
                          colors: [
                            Colors.orange,
                            Colors.yellow,
                          ],
                        ),
                        startWidth: 30,
                        endWidth: 30,
                      ),
                      GaugeRange(
                        startValue: 200,
                        endValue: 300,
                        gradient: const SweepGradient(
                          colors: [
                            Colors.yellow,
                            Colors.green,
                          ],
                        ),
                        startWidth: 30,
                        endWidth: 30,
                      )
                    ],
                    pointers: const <GaugePointer>[
                      NeedlePointer(
                        value: 150,
                        enableAnimation: true,
                        knobStyle: KnobStyle(
                          knobRadius: 0.05,
                        ),
                      )
                    ],
                    annotations: const <GaugeAnnotation>[
                      GaugeAnnotation(
                        widget: Text(
                          'Financial\nHealth',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        angle: 90,
                        positionFactor: 0.4,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 8,
        ),
        const Text("Poor"),
        const Spacer(),
      ],
    );
  }
}

class StackWidget extends StatelessWidget {
  const StackWidget({super.key, required this.data});

  final List<int> data;

  Color? getColor(int index, num value) {
    switch (value) {
      case <= 50:
        if (index < 1) {
          return Colors.red;
        } else {
          return Colors.grey[300];
        }
      case <= 100:
        if (index < 2) {
          return Colors.red;
        } else {
          return Colors.grey[300];
        }
      case <= 150:
        if (index < 3) {
          return Colors.yellow;
        } else {
          return Colors.grey[300];
        }
      case <= 200:
        if (index < 4) {
          return Colors.yellow;
        } else {
          return Colors.grey[300];
        }
      case <= 250:
        if (index < 5) {
          return Colors.green;
        } else {
          return Colors.grey[300];
        }
      case <= 300:
        if (index < 6) {
          return Colors.green;
        } else {
          return Colors.grey[300];
        }

      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List<Widget>.generate(
        6,
        (r) => Column(
          children: List<Widget>.generate(
                6,
                (c) => Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0),
                  decoration: BoxDecoration(
                    color: getColor(c, data.reversed.toList()[r]),
                    borderRadius: BorderRadius.circular(
                      50.0,
                    ),
                  ),
                  height: 8,
                  width: 50,
                ),
              ).reversed.toList() +
              [
                Text(
                  "${DateFormat.MMM().format(DateTime.now().subtract(
                    Duration(
                      days: r * 31,
                    ),
                  ))}, ${DateFormat.y().format(DateTime.now().subtract(
                        Duration(
                          days: r * 31,
                        ),
                      )).substring(2)}",
                ),
              ],
        ),
      ).reversed.toList(),
    );
  }
}
