import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hydroponic_system/actions/led.dart';
import 'package:hydroponic_system/actions/thresholdph.dart';
import 'package:hydroponic_system/actions/thresholdtemp.dart';
import 'package:hydroponic_system/actions/pumpbutton.dart';

import '../actions/growlight.dart';
import '../actions/powerbutton.dart';


class EditScreen extends StatelessWidget {
  Map data;

  EditScreen(this.data);

  @override
  Widget build(BuildContext context) {
    DatabaseReference ref = FirebaseDatabase.instance.ref();
    return ListView(
        children: [
          Divider(thickness: 1,color: Colors.grey,indent: 8,endIndent: 8,),
          PowerButton(data['systemState']),
          SizedBox(height: 10,),
          Pump(data['pumpState']),
          SizedBox(height: 10,),
          GrowLight(data['growLight']),
          SizedBox(height: 10,),
          LED(data['led']),
          SizedBox(height: 10,),
          ThresholdTemp(data['tempThreshold']/100),
          SizedBox(height: 10,),
          ThresholdpH(data['pHThreshold']/14),
        ]
    );
  }
}
