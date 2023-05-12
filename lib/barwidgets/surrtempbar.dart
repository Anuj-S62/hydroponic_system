import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:flutter/material.dart';

class SurrTempBar extends StatelessWidget {
  String progress;
  SurrTempBar(this.progress);

  @override

  Widget build(BuildContext context) {
    double progressValue;
    if(progress=="nan"){
      progressValue = 0;
    }
    else progressValue = double.parse(progress);
    if(progressValue >35){
      return Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height/5,
            width: MediaQuery.of(context).size.width/2.2,
            child: SfRadialGauge(axes: <RadialAxis>[
              RadialAxis(
                  minimum: 0,
                  maximum: 100,
                  showLabels: false,
                  showTicks: false,
                  axisLineStyle: AxisLineStyle(
                    thickness: 0.2,
                    cornerStyle: CornerStyle.bothCurve,
                    color: Colors.red[100],
                    thicknessUnit: GaugeSizeUnit.factor,
                  ),
                  pointers: <GaugePointer>[
                    RangePointer(
                      color: Colors.red[800],
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
                          progressValue.toStringAsFixed(1) + '°C',
                          style: TextStyle(fontSize: 23,fontWeight: FontWeight.w500, color: Colors.red[800],fontFamily: 'sans'),
                        ))
                  ]
              )
            ]
            ),
          ),
          Text("Surrounding Temp",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400, color: Colors.red[900],fontFamily: 'sans'),)
        ],
      );
    }
    if(progressValue < 18){
      return Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height/5,
            width: MediaQuery.of(context).size.width/2.2,
            child: SfRadialGauge(axes: <RadialAxis>[
              RadialAxis(
                  minimum: 0,
                  maximum: 100,
                  showLabels: false,
                  showTicks: false,
                  axisLineStyle: AxisLineStyle(
                    thickness: 0.2,
                    cornerStyle: CornerStyle.bothCurve,
                    color: Colors.blue[100],
                    thicknessUnit: GaugeSizeUnit.factor,
                  ),
                  pointers: <GaugePointer>[
                    RangePointer(
                      color: Colors.blue[800],
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
                          progressValue.toStringAsFixed(1) + '°C',
                          style: TextStyle(fontSize: 23,fontWeight: FontWeight.w500, color: Colors.blue[800],fontFamily: 'sans'),
                        ))
                  ]
              )
            ]
            ),
          ),
          Text("Surrounding Temp",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400, color: Colors.blue[900],fontFamily: 'sans'),)
        ],
      );
    }
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height/5,
          width: MediaQuery.of(context).size.width/2.2,
          child: SfRadialGauge(axes: <RadialAxis>[
            RadialAxis(
                minimum: 0,
                maximum: 100,
                showLabels: false,
                showTicks: false,
                axisLineStyle: AxisLineStyle(
                  thickness: 0.2,
                  cornerStyle: CornerStyle.bothCurve,
                  color: Colors.green[100],
                  thicknessUnit: GaugeSizeUnit.factor,
                ),
                pointers: <GaugePointer>[
                  RangePointer(
                    color: Colors.green[800],
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
                        progressValue.toStringAsFixed(1) + '°C',
                        style: TextStyle(fontSize: 23,fontWeight: FontWeight.w500, color: Colors.green[500],fontFamily: 'sans'),
                      ))
                ]
            )
          ]
          ),
        ),
        Text("Surrounding Temp",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400, color: Colors.green[500],fontFamily: 'sans'),)
      ],
    );
  }
}
