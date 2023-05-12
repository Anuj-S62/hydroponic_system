import 'package:flutter/material.dart';

class StatusTile extends StatelessWidget {
  // const StatusTile({Key? key}) : super(key: key);
  final String title;
  final String subtitle;
  final double height;
  final double width;

  const StatusTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.height,
    required this.width
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
            SizedBox(height: 5,),
            Text(title,style: TextStyle(fontSize: 20),),
            Divider(thickness: 0.5,color: Colors.black,indent: 10,endIndent: 10,),
            Text(subtitle,style: TextStyle(fontSize: 30),)
          ],
        ),
      ),
    );
  }
}
