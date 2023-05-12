import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class ContainerWaterLevel extends StatelessWidget {
  int progress;

  ContainerWaterLevel(this.progress);

  @override
  Widget build(BuildContext context) {
    const bgcolor = [Colors.red,Colors.deepOrange,Colors.orange,Colors.amber,Colors.yellow,Colors.lightGreen,Colors.green,Colors.green,Colors.green,Colors.green];
    String t = progress.toString();


    double progressValue = double.parse(t);
    // progressValue = progressValue;
    // print(progressValue);
    if(progressValue>=50.0){
      progressValue = 50.0;
    }

    progressValue = 50 - progressValue;
    // if(progressValue<15){
    //   flutterLocalNotificationsPlugin.show(0, "Water Level is Low", "System is currently OFF", NotificationDetails(
    //     android: AndroidNotificationDetails(
    //       channel.id!,
    //       channel.name,
    //       // channel.description,
    //       importance: Importance.high,
    //       color: Colors.green,
    //       playSound: true,
    //       icon: '@mipmap/ic_launcher',
    //     ),
    //   ));
    //   // BackgroundFetch.finish(taskId);
    // }
    int colIdx = progressValue.toInt() - 1;
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
                maximum: 50,
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
                        (2*progressValue).toStringAsFixed(1) + "%",
                        style: TextStyle(fontSize: 23,
                            fontWeight: FontWeight.w500,
                            color: bgcolor[colIdx][800],fontFamily: 'sans'),
                      ))
                ]
            )
          ]
          ),
        ),
        Text("Container water level", style: TextStyle(fontSize: 18,
            fontWeight: FontWeight.w400,
            color: bgcolor[colIdx][900],fontFamily: 'sans'),)
      ],
    );
  }
}