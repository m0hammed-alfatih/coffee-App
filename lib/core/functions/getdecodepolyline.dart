import 'dart:convert';

import 'package:coffee_app/core/constant/color.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

Future getPolyline(lat, long, destlat, destlong) async {
  List<LatLng> polylineco = [];
  PolylinePoints polylinePoints = PolylinePoints();
  Set<Polyline> polylineSet = {};
  String url =
      "https://maps.googleapis.com/maps/api/directions/json?origin=$lat,$long&destination=$destlat,$destlong&key=AIzaSyDbcPB1fsnMMR93oD2XGEDvQnonZU6ogIU";
  var response = await http.post(Uri.parse(url));

  var responsebody = jsonDecode(response.body);

  var point = responsebody['routes'][0]['overview_polyline']['points'];
  List<PointLatLng> result = polylinePoints.decodePolyline(point);
  if (result.isNotEmpty) {
    result.forEach((PointLatLng point) {
      polylineco.add(LatLng(point.latitude, point.longitude));
    });
  }

  Polyline polyline = Polyline(
      polylineId: PolylineId("polyline"),
      color: AppColor.primary,
      points: polylineco,
      width: 5);
  polylineSet.add(polyline);
  return polylineSet;
}
