import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hydroponic_system/actions/thresholdph.dart';
import 'package:hydroponic_system/actions/thresholdtemp.dart';
import 'package:hydroponic_system/actions/pumpbutton.dart';
import 'package:hydroponic_system/screens/cropcard.dart';


class PlantsScreen extends StatelessWidget {
  Map data;
  PlantsScreen(this.data);
  @override
  Widget build(BuildContext context) {
    String currPlant = data['currPlant'];
    return ListView(
      children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(25,15,15,15),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Selected Plant: ",style: TextStyle(color: Colors.grey[400],fontSize: 25,fontWeight: FontWeight.w600),),
                  Text(currPlant,style: TextStyle(color: Colors.amber,fontSize: 35,fontWeight: FontWeight.w600,letterSpacing: 2),)
                ],
              ),
            ),
          ),
          Divider(thickness: 1,color: Colors.grey,indent: 10,endIndent: 10,),
          CropCard("Tomato", 6, 6.5, currPlant),
          CropCard("Pepper", 5.5, 6.0, currPlant),
          CropCard("Egg Plant", 6.0, 6.0, currPlant),
          CropCard("Cucumber ", 5.0, 5.5, currPlant),
          CropCard("Strawberry", 6.0, 6.0, currPlant),
          CropCard("Courgettes", 6.0, 6.0, currPlant),
          CropCard("Banana", 5.5, 6.5, currPlant),
          CropCard("Ficus", 5.5, 6.0, currPlant),
          CropCard("Spinach", 6.0, 7.0, currPlant),
          CropCard("Lettuce", 6.0, 7.0, currPlant),
          CropCard("Cabbage", 6.5, 7.0, currPlant),
          CropCard("Broccoli", 6.0, 6.8, currPlant),
          CropCard("Asparagus", 6.0, 8.0 , currPlant),
          CropCard("Bean", 6.0, 6.0 , currPlant),
          CropCard("Basil", 5.5, 6.0 , currPlant),
          CropCard("Sage", 5.5, 6.5 , currPlant),
      ],
    );
  }
}
