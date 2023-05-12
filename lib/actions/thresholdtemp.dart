import 'package:flutter/material.dart';
import 'package:hydroponic_system/actions/thresholdtempdialog.dart';

class ThresholdTemp extends StatefulWidget {
  double thresholdval;
  ThresholdTemp(this.thresholdval, {super.key});

  @override
  State<ThresholdTemp> createState() => _ThresholdTempState();
}

class _ThresholdTempState extends State<ThresholdTemp> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15.0,10,15,0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height/12,
        width: MediaQuery.of(context).size.width,
        child:  ElevatedButton(
      onPressed: (){
        tempDialog(context, widget.thresholdval);
      },
      style: TextButton.styleFrom(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30), // <-- Radius
          ),
          foregroundColor: Colors.red,
          elevation: 2,
          backgroundColor: Colors.grey[300],

    ),
      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.all(0.0),
            child: Text("Threshold Temp",style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: 25,
                letterSpacing: 1
            ),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('${(widget.thresholdval*100).toStringAsFixed(2)}°C',style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: 25,
                letterSpacing: 1
            )),
          )
        ],
      ),
      ),
      )
    );
  }
}
