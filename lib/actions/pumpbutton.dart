import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class Pump extends StatefulWidget {
  int pumpState;
  Pump(this.pumpState, {super.key});

  @override
  State<Pump> createState() => _PumpState();
}

class _PumpState extends State<Pump> {
  final databaseReference = FirebaseDatabase.instance.ref();

  // int pumpState = 1;
  // String state = "OFF";
  @override
  Widget build(BuildContext context) {
    String state = widget.pumpState==0 ? "OFF" : "ON";
    final bgcolor = [Colors.grey[300],Colors.amber];
    return Padding(
      padding: const EdgeInsets.fromLTRB(15.0,10,15,0),
      child: Container(
        height: MediaQuery.of(context).size.height/12,
        width: MediaQuery.of(context).size.width,
        // width: 0,
        child: ElevatedButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("PUMP",style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 25,
                  letterSpacing: 2
                ),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(state,style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 25,
                  letterSpacing: 2
                )),
              )
            ],
          ),
          onPressed: ()async{
              setState(() {
                widget.pumpState =  1 - widget.pumpState;
              });
            await databaseReference.update({"pumpState":widget.pumpState});
          },
          style: TextButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30), // <-- Radius
              ),
              foregroundColor: Colors.red,
              elevation: 2,
              backgroundColor: bgcolor[widget.pumpState]),

        ),
      ),
    );
  }
}