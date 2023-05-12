import 'package:flutter/material.dart';

class PlantStatusTile extends StatelessWidget {
  // const StatusTile({Key? key}) : super(key: key);
  final String title;
  final String subtitle;
  final double height;
  final double width;
  final String nit;
  final String phos;
  final String pota;

  const PlantStatusTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.nit,
    required this.phos,
    required this.pota,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bgcolor = [Colors.grey[300],Colors.amber];
    int colIdx = 0;
    if(subtitle=="ON"){
      colIdx = 1;
    }
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        // height: MediaQuery.of(context).size.height / 8,
        // width: MediaQuery.of(context).size.width / 2.2,
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: bgcolor[colIdx],
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 8.0,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            SizedBox(height: 10,),
            Text(title,style: TextStyle(fontSize: 20),),
            Divider(thickness: 0.5,color: Colors.black,indent: 10,endIndent: 10,),
            Text(subtitle,style: TextStyle(fontSize: 30),),
            Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Nitrogen: "+nit+"g/L",style: TextStyle(fontSize: 18)),
                    Text("Phosphorus: "+phos+"g/L",style: TextStyle(fontSize: 18)),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0,0,0,0),
                  child: Text("Potassium: "+pota+"g/L",style: TextStyle(fontSize: 18)),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
