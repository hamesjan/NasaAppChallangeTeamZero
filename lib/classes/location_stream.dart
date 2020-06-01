import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:nasaapp/classes/enviro_data.dart';



class LocationServer {

  // ignore: close_sinks
  final _locationController = StreamController<String>();


  Stream<String> get stream => _locationController.stream;


  LocationServer(){
    Timer.periodic(Duration(seconds: 5), (t) async {
      // add the http status code = 200
      Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);


      _locationController.add('Latitude: ${position.latitude}\nLongitutde: ${position.longitude}');
    });

  }
}

String buildResponse(String res) {
  String response = '';
  Map temp = jsonDecode(res);
  if (temp['Alert']){
    response += 'ALERT! ';
    response += temp['Message'];
  } else {
    response += 'No Alert';
  }
  return response;
}