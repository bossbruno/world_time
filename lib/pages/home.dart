import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Home extends StatefulWidget {


  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
   data =data.isNotEmpty? data : ModalRoute.of(context)?.settings.arguments as Map;
   print(data);

//set background
    String? bgimage = data["isdayime"]? "daytime.jpg" : "nighttime.jpg";
    Color? bgcolor = data["isdayime"]? Colors.cyan[800] : Colors.black;

    return Scaffold(
backgroundColor: bgcolor,
      body: SafeArea(child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/$bgimage"),
          fit: BoxFit.cover,)
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120,0,0),
          child: Column(
            children: [
              TextButton.icon(icon: Icon(Icons.edit_location,
              color: bgcolor,),
                  onPressed:()async{
              dynamic result = await Navigator.pushNamed(context, "/location");
              setState(() {
                data = {
                  "time": result["time"],
                  "location":result["location"],
                  "isdayime" : result["isdayime"],
                  "flag" : result["flag"]
                };
              });

              }, label:Text("Choose Location",
                  style: TextStyle(
                    fontSize: 30
                  ),)),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(data["location"],
                  style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 2,
                    color: bgcolor
                  ),),
                  SizedBox(width: 10),
                  CircleAvatar(backgroundImage:AssetImage("assets/${data["flag"]}"),),
                ],
              ),
              SizedBox(height: 20),
              Text(data["time"],
              style: TextStyle(fontSize: 60,
              color: bgcolor),)
            ],
          ),
        ),
      )),
    );
  }
}
