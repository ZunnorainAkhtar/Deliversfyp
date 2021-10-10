import 'package:Delivers/Models/DirectDetails.dart';
import 'package:Delivers/configMaps.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:Delivers/Assistants/requestAssistant.dart';

/*lass assistantMethods{
  static Future<DirectionDetails> obtainPlaceDirectionDetails(LatLng initialPosition, LatLng finalPosition) async{
    String directionUrl = "https://maps.googleapis.com/maps/api/directions/json?origin=${initialPosition.latitude},${initialPosition.longitude}&destination=${finalPosition.latitude},${finalPosition.longitude}&key=mapKey";
    var res = await RequestAssistant.getRequest(directionUrl);
    if(res == "failed")
    {
      return null;
    }
    DirectionDetails directionDetails = DirectionDetails();
    directionDetails.encodedPoints = res["routes"][0]["overview_polyline"]["points"];
    directionDetails.distancetext = res["routes"][0]["legs"][0]["distance"]["text"];
    directionDetails.distancevalue = res["routes"][0]["legs"][0]["distance"]["value"];
    directionDetails.durationtext = res["routes"][0]["legs"][0]["duration"]["text"];
    directionDetails.durationvalue = res["routes"][0]["legs"][0]["duration"]["v"
        ""
        ""
        ""
        "+"
        "ue"];
    return directionDetails;
  }
}*/