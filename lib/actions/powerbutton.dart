import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class PowerButton extends StatefulWidget {
  int systemState;
  PowerButton(this.systemState);

  @override
  State<PowerButton> createState() => _PowerButtonState();
}

class _PowerButtonState extends State<PowerButton> {

  final databaseReference = FirebaseDatabase.instance.ref();
  @override
  Widget build(BuildContext context) {
    String state = widget.systemState==0 ? "OFF" : "ON";
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
                child: Text("System",style: TextStyle(
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
              widget.systemState =  1 - widget.systemState;
            });
            await databaseReference.update({"systemState":widget.systemState});
          },
          style: TextButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30), // <-- Radius
              ),
              foregroundColor: Colors.red,
              elevation: 2,
              backgroundColor: bgcolor[widget.systemState]),

        ),
      ),
    );
  }
}
