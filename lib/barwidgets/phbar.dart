import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:flutter/material.dart';

class PH extends StatelessWidget {
  String progress;

  PH(this.progress);

  @override
  Widget build(BuildContext context) {
    const bgcolor = [Colors.red,Colors.red,Colors.deepOrange,Colors.orange,Colors.amber,Colors.yellow,Colors.lightGreen,Colors.green,Colors.green,Colors.cyan,Colors.blue,Colors.blue,Colors.purple,Colors.indigo,Colors.indigo];
    double progressValue = double.parse(progress);
    int colIdx = progressValue.toInt() - 1;
    if(progressValue.toInt()==0){
      colIdx = 0;
    }
      return Column(
        children: [
          Container(
            height: MediaQuery
                .of(context)
                .size
                .height / 5,
            width: MediaQuery
                .of(context)
                .size
                .width / 2.2,
            child: SfRadialGauge(axes: <RadialAxis>[
              RadialAxis(
                  minimum: 0,
                  maximum: 14,
                  showLabels: false,
                  showTicks: false,
                  axisLineStyle: AxisLineStyle(
                    thickness: 0.2,
                    cornerStyle: CornerStyle.bothCurve,
                    color: bgcolor[colIdx][100],
                    thicknessUnit: GaugeSizeUnit.factor,
                  ),
                  pointers: <GaugePointer>[
                    RangePointer(
                      color: bgcolor[colIdx][800],
                      value: progressValue,
                      cornerStyle: CornerStyle.bothCurve,
                      width: 0.2,
                      sizeUnit: GaugeSizeUnit.factor,
                    )
                  ],
                  annotations: <GaugeAnnotation>[
                    GaugeAnnotation(
                        positionFactor: 0.1,
                        angle: 90,
                        widget: Text(
                          progressValue.toStringAsFixed(1),
                          style: TextStyle(fontSize: 23,
                              fontWeight: FontWeight.w500,
                              color: bgcolor[colIdx][800],fontFamily: 'sans'),
                        ))
                  ]
              )
            ]
            ),
          ),
          Text("pH", style: TextStyle(fontSize: 18,
              fontWeight: FontWeight.w400,
              color: bgcolor[colIdx][900],fontFamily: 'sans'),)
        ],
      );
  }
}