import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:nasaapp/classes/location_stream.dart';

class LeftPage extends StatefulWidget {
  @override
  _LeftPageState createState() => _LeftPageState();
}

class _LeftPageState extends State<LeftPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Colors.greenAccent,
            Colors.yellowAccent
          ]
        )
      ),
      child: StreamBuilder(
        stream: LocationServer().stream,
        builder: (context,snapshot) {
          if(!snapshot.hasData){
            return Row(  mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(backgroundColor: Colors.white,)
              ],
            );
          } else if (snapshot.hasError){
            return Row(  mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(backgroundColor: Colors.white,)
              ],
            );
          }
          else if (snapshot.connectionState == ConnectionState.done){
            CircularProgressIndicator(backgroundColor: Colors.white,);
          }
          return  Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
            SizedBox(height: 20,),
            Text('${snapshot.data.toString()}',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                )
            ),
            SizedBox(height: 80,),
            Container(
              width: MediaQuery.of(context).size.width /1.5,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(25))
                ),
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
              Icon(Icons.wb_sunny,
                color: Colors.yellow,
               ),
            SizedBox(height: 15,),
            Text('17˚ C', style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22
            ),),
          //  Divider(thickness: 3, color: Colors.green,),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 3,
              color: Colors.green,
              width: MediaQuery.of(context).size.width / 2,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.wb_sunny),
                SizedBox(width: 5,),
                Text('UV Index: 10.28')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.invert_colors),
                SizedBox(width: 5,),
                Text('Humidity: 72')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.cloud),
                SizedBox(width: 5,),
                Text('Clouds: 1')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.cloud_queue),
                SizedBox(width: 5,),
                Text('Forecast: Clear')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.blur_on),
                SizedBox(width: 5,),
                Text('Air Quality Index: 32')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.local_florist),
                SizedBox(width: 5,),
                Text('Pollen Level: 1013')
              ],
            ),
          ],

            ),
            ),



            // Text('${snapshot.data[1].toString()}',
          ],
          );
        },
      ),
    );
  }
}
