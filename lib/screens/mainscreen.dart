import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hydroponic_system/barwidgets/cntwaterlevel.dart';
import 'package:hydroponic_system/barwidgets/humiditybar.dart';
import 'package:hydroponic_system/barwidgets/phbar.dart';
import 'package:hydroponic_system/barwidgets/pipewaterlevelbar.dart';
import 'package:hydroponic_system/barwidgets/statustile.dart';
import 'package:hydroponic_system/barwidgets/surrtempbar.dart';
import 'package:hydroponic_system/barwidgets/watertempbar.dart';

import '../barwidgets/plantstatustile.dart';


class GetStream extends StatelessWidget {
  Map data;
  GetStream(this.data);

  @override
  Widget build(BuildContext context) {
    DatabaseReference ref = FirebaseDatabase.instance.ref();
    String pump = data['pumpState']==1 ? "ON" : "OFF";
    String thresholdTemp = data['tempThreshold'].toStringAsFixed(2) + '°C';
    String thresholdpH = data['pHThreshold'].toStringAsFixed(2);
    String systemState = data['systemState']==1 ? "ON" : "OFF";
    String plant = data['currPlant'];
    String nit = data['nit'].toString();
    String phos = data['phos'].toString();
    String pota = data['pota'].toString();
    String led = data['led']==1 ? "ON" : "OFF";
    String growLight = data['growLight']==1 ? "ON" : "OFF";


    return ListView(
      children: [
        Divider(thickness: 1,color: Colors.grey,indent: 8,endIndent: 8,),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10,0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SurrTempBar(data['surrtemp']),
              WaterTempBar(data['waterTemp'])
            ],
          ),
        ),
        SizedBox(height: 30,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HumidityBar(data['humidity']),
            PH(data['ph'])
          ],
        ),
        SizedBox(height: 30,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            PipeWaterLevel(data['pipeWaterLevel']),
            ContainerWaterLevel(data['cntWaterLevel']),
          ],
        ),
        SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0,0,20,0),
          child: PlantStatusTile(title: "SELECTED PLANT", subtitle: plant,nit: nit,phos: phos,pota: pota, height: 160, width: 200),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(18.0,0,18,0,),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StatusTile(title: "SYSTEM", subtitle: systemState, height: 100, width: 160),

              StatusTile(title: "THRESHOLD TEMP", subtitle: thresholdTemp,height: 100,width: 200,),
            ],
          ),
        ),
        // SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
          child: Row(
            children: [

              StatusTile(title: "THRESHOLD pH", subtitle: thresholdpH,height: 100,width: 200,),
              StatusTile(title: "PUMP", subtitle: pump,height: 100,width: 160,),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(18.0,0,18,0,),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StatusTile(title: "L E D", subtitle: led, height: 100, width: 160),

              StatusTile(title: "GROW LIGHT", subtitle: growLight,height: 100,width: 200,),
            ],
          ),
        ),
        SizedBox(height: 30,),
      ],
    );
  }
}