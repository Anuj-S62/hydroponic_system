import 'package:flutter/material.dart';
import 'package:hydroponic_system/actions/sliderph.dart';

class ThresholdpH extends StatefulWidget {
  double thresholdval;
 ThresholdpH(this.thresholdval, {super.key});

  @override
  State<ThresholdpH> createState() => _ThresholdpHState();
}

class _ThresholdpHState extends State<ThresholdpH> {

  Future pHDialog(context,val) async{
    showDialog(
        context: context,
        builder: (context)=>AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            elevation: 5,
            backgroundColor: Colors.grey[900],
            title: Text("Set threshold pH",style: TextStyle(color: Colors.grey[200])),
            content: Builder(
              builder: (context) {

                return SizedBox(
                  height: MediaQuery.of(context).size.height/8,
                  child: SliderpH(val),
                );
              },
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(15.0,10,15,0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height/12,
          width: MediaQuery.of(context).size.width,
          child:  ElevatedButton(
            onPressed: (){
              pHDialog(context, widget.thresholdval);
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
                  child: Text("Threshold pH",style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 25,
                      letterSpacing: 1
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text((widget.thresholdval*14).toStringAsFixed(2),style: const TextStyle(
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
