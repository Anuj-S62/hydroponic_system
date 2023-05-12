import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:flutter/material.dart';

class HumidityBar extends StatelessWidget {
  String progress;
  HumidityBar(this.progress);

  @override

  Widget build(BuildContext context) {
    const bgcolor = [Colors.red,Colors.green,Colors.blue,Colors.purple];
    double progressValue;
    if(progress=="nan"){
      progressValue = 0;
    }
    else progressValue = double.parse(progress);
    if(progressValue >44){
      return Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height/5,
            width: MediaQuery.of(context).size.width/2.2,
            child: SfRadialGauge(axes: <RadialAxis>[
              RadialAxis(
                  showLabels: false,
                  showTicks: false,
                  startAngle: 270,
                  endAngle: 270,
                  // radiusFactor: 0.8,
                  canScaleToFit: true,
                  axisLineStyle: AxisLineStyle(
                    thickness: 0.2,
                    color: Colors.red[100],
                    thicknessUnit: GaugeSizeUnit.factor,
                    cornerStyle: CornerStyle.bothCurve,
                  ),
                  pointers: <GaugePointer>[
                    RangePointer(
                      color: Colors.red[800],
                        value: progressValue,
                        width: 0.2,
                        sizeUnit: GaugeSizeUnit.factor,
                        cornerStyle: CornerStyle.bothCurve
                    )
                  ],
                  annotations: <GaugeAnnotation>[
                    GaugeAnnotation(
                        positionFactor: 0.1,
                        angle: 90,
                        widget: Text(
                          progressValue.toStringAsFixed(1) + '%',
                          style: TextStyle(fontSize: 23,fontWeight: FontWeight.w500, color: Colors.red[800],fontFamily: 'sans'),
                        ))
                  ]
              )
            ]
            ),
          ),
          Text("Humidity",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400, color: Colors.red[900],fontFamily: 'sans'),)
        ],
      );
    }
    if(progressValue < 30){
      return Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height/5,
            width: MediaQuery.of(context).size.width/2.2,
            child: SfRadialGauge(axes: <RadialAxis>[
              RadialAxis(
                  showLabels: false,
                  showTicks: false,
                  startAngle: 270,
                  endAngle: 270,
                  // radiusFactor: 0.8,
                  canScaleToFit: true,
                  axisLineStyle: AxisLineStyle(
                    thickness: 0.2,
                    color: Colors.indigo[100],
                    thicknessUnit: GaugeSizeUnit.factor,
                    cornerStyle: CornerStyle.bothCurve,
                  ),
                  pointers: <GaugePointer>[
                    RangePointer(
                      color: Colors.indigo[800],
                        value: progressValue,
                        width: 0.2,
                        sizeUnit: GaugeSizeUnit.factor,
                        cornerStyle: CornerStyle.bothCurve
                    )
                  ],
                  annotations: <GaugeAnnotation>[
                    GaugeAnnotation(
                        positionFactor: 0.1,
                        angle: 90,
                        widget: Text(
                          progressValue.toStringAsFixed(1) + '%',
                          style: TextStyle(fontSize: 23,fontWeight: FontWeight.w500, color: Colors.indigo[800],fontFamily: 'sans'),
                        ))
                  ]
              )
            ]
            ),
          ),
          Text("Humidity",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400, color: Colors.indigo[900],fontFamily: 'sans'),)
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
                showLabels: false,
                showTicks: false,
                startAngle: 270,
                endAngle: 270,
                // radiusFactor: 0.8,
                canScaleToFit: true,
                axisLineStyle: AxisLineStyle(
                  thickness: 0.2,
                  color: Colors.orangeAccent[100],
                  thicknessUnit: GaugeSizeUnit.factor,
                  cornerStyle: CornerStyle.bothCurve,
                ),
                pointers: <GaugePointer>[
                  RangePointer(
                      color: Colors.orange[800],
                      value: progressValue,
                      width: 0.2,
                      sizeUnit: GaugeSizeUnit.factor,
                      cornerStyle: CornerStyle.bothCurve
                  )
                ],
                annotations: <GaugeAnnotation>[
                  GaugeAnnotation(
                      positionFactor: 0.1,
                      angle: 90,
                      widget: Text(
                        progressValue.toStringAsFixed(1) + '%',
                        style: TextStyle(fontSize: 23,fontWeight: FontWeight.w500, color: Colors.orange[900],fontFamily: 'sans'),
                      ))
                ]
            )
          ]
          ),
        ),
        Text("Humidity",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400, color: Colors.orange[900],fontFamily: 'sans'),)
      ],
    );
  }
}
