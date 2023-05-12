import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:firebase_database/firebase_database.dart';


class ColorPickerWid extends StatefulWidget {
  const ColorPickerWid({Key? key}) : super(key: key);



  @override
  State<ColorPickerWid> createState() => _ColorPickerWidState();
}

class _ColorPickerWidState extends State<ColorPickerWid> {
  Future colorDialog() async {
    showDialog(context: context,
        builder: (context)=>AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 5,
          backgroundColor: Colors.grey[900],
          title: Text("Pick Color",style: TextStyle(color: Colors.grey[300])),
          content: Container(
            child: BlockPicker(
              pickerColor: Colors.red, //default color
              onColorChanged: (Color color){ //on color picked
                print(color);
              },
            ),
          ),
        ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}
