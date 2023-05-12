import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';


class CropCard extends StatefulWidget {
  String name;
  double low,high;
  String currPlant;
  CropCard(this.name,this.low,this.high,this.currPlant);

  @override
  State<CropCard> createState() => _CropCardState();
}

class _CropCardState extends State<CropCard> {
  final databaseReference = FirebaseDatabase.instance.ref();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0,5,0,5),
      child: Container(
        height: MediaQuery.of(context).size.height/12,
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.name,style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[600],
                    fontSize: 25,
                    letterSpacing: 0
                ),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.low.toString() + "-" + widget.high.toString(),style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 25,
                    letterSpacing: 0
                )),
              )
            ],
          ),
          onPressed: ()async{
            await databaseReference.update({"currPlant":widget.name});
            await databaseReference.update({"pHThreshold":(widget.low + widget.high)/2.0});
          },
          style: TextButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30), // <-- Radius
              ),
              foregroundColor: Colors.red,
              elevation: 2,
              backgroundColor: Colors.black),
        ),
      ),
    );
  }
}
