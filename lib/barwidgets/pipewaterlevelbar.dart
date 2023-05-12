import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:flutter/material.dart';

class PipeWaterLevel extends StatelessWidget {
  int progress;

  PipeWaterLevel(this.progress);

  @override
  Widget build(BuildContext context) {
    const bgcolor = [Colors.red,Colors.red,Colors.deepOrange,Colors.orange,Colors.amber,Colors.yellow,Colors.cyan,Colors.lightGreen,Colors.lightGreen,Colors.lightGreen,Colors.green,Colors.green];
    String t = progress.toString();
    double progressValue = double.parse(t);
    // progressValue = progressValue/2;
    if(progressValue<450){
      progressValue += 1;
      progressValue = progressValue/450;
    }
    else if(progressValue<760){
      progressValue = progressValue - 450;
      progressValue = progressValue/10;
    }
    else if(progressValue<830){
      progressValue = progressValue - 760;
      progressValue = progressValue/2.6;
    }
    else if(progressValue<930){
      progressValue = progressValue - 830;
      progressValue = progressValue/1.333;
    }
    else{
      // progressValue = progressValue - 1024;
      // progressValue = progressValue/0.94;
      progressValue = 99.7;
    }
    print(progressValue);
    // if(progressValue<=0){
    //   progressValue = 0;
    // }
    // else{
    //   progressValue = progressValue/7;
    // }
    int colIdx = progressValue.toInt();
    // colIdx = colIdx/10;
    if(progressValue<10){
      colIdx = 0;
    }
    else if(progressValue<20){
      colIdx = 1;
    }
    else if(progressValue<30){
      colIdx = 2;
    }
    else if(progressValue<40){
      colIdx = 3;
    }
    else if(progressValue<50){
      colIdx = 4;
    }
    else if(progressValue<60){
      colIdx = 5;
    }
    else if(progressValue<70){
      colIdx = 6;
    }
    else if(progressValue<80){
      colIdx = 7;
    }
    else if(progressValue<90){
      colIdx = 8;
    }
    else if(progressValue<100){
      colIdx = 9;
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
                maximum: 100,
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
                        progressValue.toStringAsFixed(1) + "%",
                        style: TextStyle(fontSize: 23,
                            fontWeight: FontWeight.w500,
                            color: bgcolor[colIdx][800],fontFamily: 'sans'),
                      ))
                ]
            )
          ]
          ),
        ),
        Text("pipe water level", style: TextStyle(fontSize: 18,
            fontWeight: FontWeight.w400,
            color: bgcolor[colIdx][900],fontFamily: 'sans'),)
      ],
    );
  }
}