import 'package:flutter/material.dart';
import 'gridviewitembin.dart';
import 'reorderablegridview_flutter_packet.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
    )
  );
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
    
  }
}

class _MyAppState extends State<MyApp> {
  
String title = 'ReorGridView';
List<ItemBin> itemBins = List();
var editSwitchController = EditSwitchController();
List<String> number=["1","2","3","4","5","6","7","8","9"];

@override
  void initState() {
    super.initState();
    number.forEach((nextnum) {
        itemBins.add(ItemBin(nextnum));
      }
    );
  }
  
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text(title),
    ),
      body: OrientationBuilder(
      builder: (context, orientation) {
        return DragAbleGridView(
          mainAxisSpacing: 25.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: 1,
          crossAxisCount: orientation == Orientation.portrait ? 4 : 5,
          deleteIcon: null,
          itemBins:itemBins,
          editSwitchController:editSwitchController,
          isOpenDragAble: true,
          animationDuration: 100, 
          longPressDuration: 100, 
          //deleteIcon: new Image.asset("images/close.png",width: 15.0 ,height: 15.0 ),
          child: (int position){
            return Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              decoration: BoxDecoration(
              border: Border.all(color: Colors.black)),
              margin: EdgeInsets.only(top: 1.0,right: 1.0),
              child: Text(
                itemBins[position].data,
                style: TextStyle(fontSize: 25.0,
                color: Colors.black),
                ),
          );
        },
       );
        }
      ),
    );
  }
}