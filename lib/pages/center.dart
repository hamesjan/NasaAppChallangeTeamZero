import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CenterPage extends StatefulWidget {
  @override
  _CenterPageState createState() => _CenterPageState();
}

class _CenterPageState extends State<CenterPage> {
  @override
  Widget build(BuildContext context) {
    List description = ['I love this SPOT! XD #OutDoorsy', 'Camped here with my cousins!', 'I love this app!'];
    List Location = ['278 Hanover Street Dedham, MA 02026', '9165 John Ave. Suro, FL 32003','65 SE. King Drive Scarsdale, NY 10583'];
    List usernames = ['OutDoorsian2', 'muntaser', 'hamesjan'];

    return ListView.builder(
        itemCount: description.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                color: Colors.greenAccent,
                child: AppBar(
                  leading:Icon(Icons.person),
                  title: Text(usernames[index]),
                  actions: <Widget>[
                    Icon(Icons.more_horiz)
                  ],
                )
              ),
              Container(
                child: Image(image: AssetImage('assets/images/image-${index + 1}.png'),),
              ),
              AppBar(
                backgroundColor: Colors.greenAccent,
                title: Text(Location[index], style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.black
                ),),
                actions: <Widget>[
                  Icon(Icons.favorite,color: Colors.redAccent,),
                  SizedBox(width: 10,),
                  Icon(Icons.comment, color: Colors.grey,),
                  SizedBox(width: 10,),
                  Icon(Icons.send, color: Colors.grey,),
                  SizedBox(width: 10,),
                ],
              ),
              SizedBox(height: 5,),
              Container(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 5,
                    ),
                    Text(usernames[index],style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),),
                    SizedBox(
                      width: 10,
                    ),
                    Text(description[index])
                  ],
                ),
              ),
            ],
          );
        }
    );
  }
}
