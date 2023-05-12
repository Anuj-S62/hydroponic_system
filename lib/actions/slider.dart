import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class SliderWid extends StatefulWidget {
  double thresholdval;
  SliderWid(this.thresholdval);

  @override
  State<SliderWid> createState() => _SliderWidState();
}

class _SliderWidState extends State<SliderWid> {
  final databaseReference = FirebaseDatabase.instance.ref();
  @override
  Widget build(BuildContext context) {
    double val = widget.thresholdval;
    double val2 = val*100;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0,0,0,0),
          child: Container(
            alignment: Alignment.topLeft,
            child: Text("            "+val2.toStringAsFixed(2)+ '°C',
                style: TextStyle(fontSize: 23,fontWeight: FontWeight.w500, color: Colors.white)),
          ),
        ),
        Container(
          child: Slider(value: val,
              label: "Threshold Temperature",
              activeColor: Colors.white,
              inactiveColor: Colors.grey[700],
              onChanged: (double v) async{
            setState(() {
              widget.thresholdval = v;
            });
            await databaseReference.update({"tempThreshold":widget.thresholdval*100});
              }
          ),
        ),
      ],
    );
  }
}
