
import 'package:flutter/cupertino.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {


  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void setupWorldtime() async {
    WorldTime wtm = WorldTime(location:"Berlin", flag: "germany.png", url: "Europe/Berlin");
   await wtm.getTime();
   Navigator.pushReplacementNamed(context, "/home", arguments: {
     "location" : wtm.location,
     'flag':wtm.flag,
     "time":wtm.time,
     "url":wtm.url,
     "isdayime" : wtm.isDaytime

   });



  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

setupWorldtime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[600],

      body: Center(
          child: Column(
          children:[ SizedBox(height: 300,),
            TextButton.icon(icon: Icon(Icons.more_time,
          color: Colors.white,
          size: 50,),
              onPressed:(){},
              label:Text("Worldie",
              style: TextStyle(
                fontSize: 50,
                color: Colors.white

              ),)),

            SpinKitWave(
              color: Colors.white,
              size: 50.0),
          ]
          ),
        ),



    );
  }
}
