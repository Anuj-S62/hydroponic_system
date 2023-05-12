import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:flutter/material.dart';
class WaterTempBar extends StatelessWidget {
  String progress;
  WaterTempBar(this.progress);

  @override

  Widget build(BuildContext context) {
    double progressValue = double.parse(progress);
    if(progressValue >=28){
      return Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height/5,
            width: MediaQuery.of(context).size.width/2.2,
            child: SfRadialGauge(axes: <RadialAxis>[
              // Create primary radial axis
              RadialAxis(
                  minimum: 0,
                  maximum: 100,
                  showLabels: false,
                  showTicks: false,
                  axisLineStyle: AxisLineStyle(
                    thickness: 0.2,
                    color: Colors.red[100],
                    thicknessUnit: GaugeSizeUnit.factor,
                  ),
                  pointers: <GaugePointer>[
                    RangePointer(
                      color: Colors.red[900],
                      value: progressValue,
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
                          style: TextStyle(fontSize: 23,fontWeight: FontWeight.w500, color: Colors.red[900],fontFamily: 'sans'),
                        ))
                  ]
              ),
              // Create secondary radial axis for segmented line
              RadialAxis(
                minimum: 0,
                interval: 1,
                maximum: 40,
                showLabels: false,
                showTicks: true,
                showAxisLine: false,
                offsetUnit: GaugeSizeUnit.factor,
                minorTicksPerInterval: 0,
                majorTickStyle: MajorTickStyle(
                    length: 0.2,
                    thickness: 2.5,
                    lengthUnit: GaugeSizeUnit.factor,
                    color: Colors.black),
              )
            ]
            ),
          ),
          Text("Water Temp",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400, color: Colors.red[900],fontFamily: 'sans'),)
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
              // Create primary radial axis
              RadialAxis(
                  minimum: 0,
                  maximum: 100,
                  showLabels: false,
                  showTicks: false,
                  axisLineStyle: AxisLineStyle(
                    thickness: 0.2,
                    color: Colors.tealAccent[100],
                    thicknessUnit: GaugeSizeUnit.factor,
                  ),
                  pointers: <GaugePointer>[
                    RangePointer(
                      color: Colors.tealAccent[900],
                      value: progressValue,
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
                          style: TextStyle(fontSize: 23,fontWeight: FontWeight.w500, color: Colors.tealAccent[700],fontFamily: 'sans'),
                        ))
                  ]
              ),
              // Create secondary radial axis for segmented line
              RadialAxis(
                minimum: 0,
                interval: 1,
                maximum: 40,
                showLabels: false,
                showTicks: true,
                showAxisLine: false,
                offsetUnit: GaugeSizeUnit.factor,
                minorTicksPerInterval: 0,
                majorTickStyle: MajorTickStyle(
                    length: 0.2,
                    thickness: 2.5,
                    lengthUnit: GaugeSizeUnit.factor,
                    color: Colors.black),
              )
            ]
            ),
          ),
          Text("Water Temp",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400, color: Colors.tealAccent[800],fontFamily: 'sans'),)
        ],
      );
    }
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height/5,
          width: MediaQuery.of(context).size.width/2.2,
          child: SfRadialGauge(axes: <RadialAxis>[
            // Create primary radial axis
            RadialAxis(
              minimum: 0,
              maximum: 100,
              showLabels: false,
              showTicks: false,
              axisLineStyle: AxisLineStyle(
                thickness: 0.2,
                color: Colors.amber[100],
                thicknessUnit: GaugeSizeUnit.factor,
              ),
              pointers: <GaugePointer>[
                RangePointer(
                  color: Colors.amber[900],
                  value: progressValue,
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
                        style: TextStyle(fontSize: 23,fontWeight: FontWeight.w500, color: Colors.amber[900],fontFamily: 'sans'),
                      ))
                ]
            ),
            // Create secondary radial axis for segmented line
            RadialAxis(
              minimum: 0,
              interval: 1,
              maximum: 40,
              showLabels: false,
              showTicks: true,
              showAxisLine: false,
              offsetUnit: GaugeSizeUnit.factor,
              minorTicksPerInterval: 0,
              majorTickStyle: MajorTickStyle(
                  length: 0.2,
                  thickness: 3.5,
                  lengthUnit: GaugeSizeUnit.factor,
                  color: Colors.black),
            )
          ]
          ),
        ),
        Text("Water Temp",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400, color: Colors.amber[900],fontFamily: 'sans'),)
      ],
    );
  }
}
