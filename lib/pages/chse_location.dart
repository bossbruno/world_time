import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:world_time/services/world_time.dart';
class ChooseLocation extends StatefulWidget {

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: "Africa/Accra", location: "Accra", flag: "ghanaflag.png"),
    WorldTime(url: "America/Chicago", location: "Chicago", flag:"america.png" ),
    WorldTime(url:"Asia/Seoul", location: "Seoul", flag: "skorea.png")
  ];

 void updateTime(index) async{
   WorldTime wtm = locations[index];
   await wtm.getTime();
   Navigator.pop(context, {
     "location" : wtm.location,
     'flag':wtm.flag,
     "time":wtm.time,
     "url":wtm.url,
     "isdayime" : wtm.isDaytime
   });
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Choose a Location"),
        centerTitle: true,
      ),
      body: ListView.builder(itemCount: locations.length,
      itemBuilder: (context,index){
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
          child: Card(
            child:ListTile(onTap: (){
              updateTime(index);
            },
            title: Text(locations[index].location),
              leading: CircleAvatar(backgroundImage: AssetImage("assets/${locations[index].flag}"),),
            )
          ),
        );
      }),

    );
  }
}
