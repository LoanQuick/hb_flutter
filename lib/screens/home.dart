import 'package:flutter/material.dart';
import 'package:hb_flutter/services/color.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            HexColor.fromHex("#DAD5FB"),
            HexColor.fromHex("#FFFFFF"),
          ],
          begin: Alignment.topCenter,
        ),
        // image:
        // color: Colors.blue,
      ),
      child: const Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: FlutterLogo(),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Hi, Abhinav!",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Spacer(),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.chat_rounded,
                    color: Colors.black45,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.notifications_active_rounded,
                    color: Colors.black45,
                  ),
                ),
              ],
            ),
            GaugeWIdget()
          ],
        ),
      ),
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
