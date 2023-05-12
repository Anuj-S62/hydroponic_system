// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:hydroponic_system/actions/colorpickerdialog.dart';

class LED extends StatefulWidget {
  int led;
  LED(this.led);

  @override
  State<LED> createState() => _LEDState();
}

class _LEDState extends State<LED> {

  final databaseReference = FirebaseDatabase.instance.ref();
  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);

  void changeColor(Color color) async{
    setState(() => pickerColor = color);
    print(color);
        String hexColor = color.toString();
        print(hexColor);
        String t = "";
        for(int i = 8;i<16;i++){
          t += hexColor[i];
        }
        print(t);
        int intColor = int.parse(t, radix: 16);
        print(intColor);
        // Extract the individual color values
        int red = (intColor >> 16) & 0xFF;
        int green = (intColor >> 8) & 0xFF;
        int blue = intColor & 0xFF;

        // Print the RGB values
        print("Red: $red, Green: $green, Blue: $blue");
        await databaseReference.update({"colorR":red});
        await databaseReference.update({"colorG":green});
        await databaseReference.update({"colorB":blue});
  }


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
          child: SingleChildScrollView(
              child: ColorPicker(
                labelTextStyle: TextStyle(color: Colors.white),
                pickerColor: pickerColor,
                onColorChanged: changeColor,
              ),

        ),
      ),
      )
    );
  }
  @override
  Widget build(BuildContext context) {
    String state = widget.led==0 ? "OFF" : "ON";
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
                child: Text("LED",style: TextStyle(
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
          onLongPress: (){
            colorDialog();
          },
          onPressed: ()async{
            setState(() {
              widget.led =  1 - widget.led;
            });
            await databaseReference.update({"led":widget.led});
          },
          style: TextButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30), // <-- Radius
              ),
              foregroundColor: Colors.red,
              elevation: 2,
              backgroundColor: bgcolor[widget.led]),

        ),
      ),
    );
  }
}
