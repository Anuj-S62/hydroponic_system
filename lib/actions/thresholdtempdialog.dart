import 'package:flutter/material.dart';
import 'package:hydroponic_system/actions/slider.dart';


Future tempDialog(context,val) async{
  showDialog(
      context: context,
      builder: (context)=>AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 5,
        backgroundColor: Colors.grey[900],
        title: Text("Set threshold temp",style: TextStyle(color: Colors.grey[200])),
      content: Builder(
        builder: (context) {
          // Get available height and width of the build area of this widget. Make a choice depending on the size.

          return Container(
            height: MediaQuery.of(context).size.height/8,
            child: SliderWid(val),
          );
        },
      )
  )
  );
}