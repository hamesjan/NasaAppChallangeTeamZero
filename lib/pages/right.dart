import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:nasaapp/widgets/custom_button.dart';
// import 'package:nasaapp/classes/CalorieData.dart';
import 'package:mime/mime.dart';


class RightPage extends StatefulWidget {
  @override
  RightPageState createState() => RightPageState();
}

class RightPageState extends State<RightPage> {
  Future<File> file;
  String status = '';
  String base64Image;
  File tmpFile;
  String errMessage = 'Error Uploading Image';


  Future<http.StreamedResponse> uploadImage(filename, url) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath('file', filename));
    var res = await request.send();
    return res;
  }


  String respStr = '';
 // CalorieData CalData = CalorieData(calories: 'Select an Image to get Started', names: ['']);
  String returnData = '';
  String returnData2 = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(width: MediaQuery.of(context).size.width/ 3.5,),
                  SendButton(
                    icon: Icon(Icons.camera_alt, size: 50,),
                    callback: () async{
                      var file = await ImagePicker.pickImage(source: ImageSource.camera);
                      var res = await uploadImage(file.path, "http://292bde44c00c.ngrok.io/file_analysis");
                      respStr = await res.stream.bytesToString();
                      setState(() {
                            returnData = respStr;
                      });
                    },
                  ),
                  SizedBox(width: 15,),
                  SendButton(
                      icon: Icon(Icons.image, size: 50,),
                      callback: () async {
                        var file = await ImagePicker.pickImage(source: ImageSource.gallery);
                        var res = await uploadImage(file.path, "http://292bde44c00c.ngrok.io/file_analysis");
                        respStr = await res.stream.bytesToString();
                        setState(() {
                          returnData = respStr;
                        });
                      }
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
           Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.all(Radius.circular(25))
                    ),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(Icons.local_florist, color: Colors.black,),
                            SizedBox(width: 15,),
                            Text('Plant Identifier', style: TextStyle(
                                fontWeight:FontWeight.bold,
                                color: Colors.black,
                                fontSize: 25

                            ),)

                          ],
                        ),
                        Divider(thickness: 5,),
                        SizedBox(height: 5,),
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.all(Radius.circular(25))
                          ),
                          child: Text('Species: $returnData', style: TextStyle(
                              // ${CalData.calories}', style: TextStyle(
                              fontSize: 20,
                              color: Colors.black
                          ),),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],

                    ),
                  )

                ],

              ),
              SizedBox(height: 5,),
              Divider(thickness: 4,color: Colors.blueAccent,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(width: MediaQuery.of(context).size.width/ 3.5,),
                  SendButton(
                    icon: Icon(Icons.camera_alt, size: 50,),
                    callback: () async{
                      var file = await ImagePicker.pickImage(source: ImageSource.camera);
                      var res = await uploadImage(file.path, "http://292bde44c00c.ngrok.io/file_analysis2");
                      respStr = await res.stream.bytesToString();
                      setState(() {
                        returnData2 = respStr;
                      });
                    },
                  ),
                  SizedBox(width: 15,),
                  SendButton(
                      icon: Icon(Icons.image, size: 50,),
                      callback: () async {
                        var file = await ImagePicker.pickImage(source: ImageSource.gallery);
                        var res = await uploadImage(file.path, "http://292bde44c00c.ngrok.io/file_analysis2");
                        respStr = await res.stream.bytesToString();
                        setState(() {
                          returnData2 = respStr;
                        });
                      }
                  ),
                ],
              ),
              SizedBox( height: 15,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.all(Radius.circular(25))
                    ),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(Icons.fastfood, color: Colors.black,),
                            SizedBox(width: 15,),
                            Text('Animal Identifier', style: TextStyle(
                                fontWeight:FontWeight.bold,
                                color: Colors.black,
                                fontSize: 25

                            ),)

                          ],
                        ),
                        Divider(thickness: 5,),
                        SizedBox(height: 5,),
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.all(Radius.circular(25))
                          ),
                          child: Text('Venom Checker: $returnData2', style: TextStyle(
                            // ${CalData.calories}', style: TextStyle(
                              fontSize: 12,
                              color: Colors.black
                          ),),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],

                    ),
                  )

                ],

              )
            ],
          ),
        )
    );
  }
}
