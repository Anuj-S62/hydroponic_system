import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class SliderpH extends StatefulWidget {
  double thresholdval;
  SliderpH(this.thresholdval, {super.key});

  @override
  State<SliderpH> createState() => _SliderpHState();
}

class _SliderpHState extends State<SliderpH> {
  final databaseReference = FirebaseDatabase.instance.ref();
  @override
  Widget build(BuildContext context) {
    double val = widget.thresholdval;
    double val2 = val*14;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0,0,0,0),
          child: Container(
            alignment: Alignment.topLeft,
            child: Text("            ${val2.toStringAsFixed(2)}",
                style: const TextStyle(fontSize: 23,fontWeight: FontWeight.w500, color: Colors.white)),
          ),
        ),
        Slider(value: val,
            label: "Threshold pH",
            activeColor: Colors.white,
            inactiveColor: Colors.grey[700],
            onChanged: (double v) async{
              setState(() {
                widget.thresholdval = v;
              });
              await databaseReference.update({"pHThreshold":widget.thresholdval*14});
            }
        ),
      ],
    );
  }
}
