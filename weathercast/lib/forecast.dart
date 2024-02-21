import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;
import 'location.dart';
import 'weather.dart';

Future<Weather> forecast() async {
  const url = 'https://data.tmd.go.th/nwpapi/v1/forecast/location/hourly/at';
  const token =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImJhYjZmZDUzNzNkMzkyZTIyZDY3NzUxZmVkMWI0ZGJkYzEzNzk1Y2NhODc2YzlmYzJiNTk1ZWFlNDY5OTFiMDBlMzkyODlkODQwM2IzZjc2In0.eyJhdWQiOiIyIiwianRpIjoiYmFiNmZkNTM3M2QzOTJlMjJkNjc3NTFmZWQxYjRkYmRjMTM3OTVjY2E4NzZjOWZjMmI1OTVlYWU0Njk5MWIwMGUzOTI4OWQ4NDAzYjNmNzYiLCJpYXQiOjE3MDc4ODIyMjYsIm5iZiI6MTcwNzg4MjIyNiwiZXhwIjoxNzM5NTA0NjI2LCJzdWIiOiIzMDA0Iiwic2NvcGVzIjpbXX0.huo3WfFao2_VgThcH4czSzDFOkbJ-SrhGvQK2fRBuoOENVLZ33LsL6EvW5MBSY-adSxlLKXjS3yPu5YCDPHfh3GUp4RjZE4WmWE9UrsKchOhy2agqZzyuuliljB_FKETbiLN3hba9UC08IFmOUiTTsmEIEakzvMIG8WbySmP2xiPTDzLCYrdCniAdNQOTqCEzGwdeQ4pMD7ZDuvdx71le8dtthBWm8Cs0-jl95rbquQPIQNMMZ1l9WukvHa8VLf70BjYGl6eRDwJAMJ-yDbb2ZCXpwzQHC8_SBBmy-GwctNrOLaob6aOitMKB1G9_fVlinysZnKhfW7GA0AYYoNFi3OSjwIkWdgoGFBVH7qdsIAp4Il9Ytjt6NissSsyag64v5nADDsJzNRt35JqhgoCGKFiInkdiNEJdfQRApu_Y-iF5vUPtsUQf0XYsWvuuHZTFutU-BihRCockgJzODzQPzhF3AJKkCwZmFxUFO7BKLGf-b_gAur3xhWCkuyoIg-sXko-6QEutASpr_G1iuBZmU4JDCDQEHdD7EeTr5HHLS1TSJzsPMowGYP790P2tGZkrjC4Bl3QKbLqnleCS3nYX4YQFO9HoiMhUWlBtRcCrGM0DAApND7vbtEnzID4edmETRjnBELJL0dJZncOX2QxCgPTiygyhwk3CmxnfGecAc4';
  try {
    Position location = await getCurrentLocation();
    http.Response response = await http.get(
        Uri.parse(
            '$url?lat=${location.latitude}&lon=${location.longitude}&fields=tc,cond'),
        headers: {
          'accept': 'application/json',
          'authorization': 'Bearer $token'
        });
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body)["WeatherForecasts"][0]["forecasts"]
          [0]["data"];
      Placemark address = (await placemarkFromCoordinates(
              location.latitude, location.longitude))
          .first;
      return Weather(
        address: '${address.subLocality}\n${address.administrativeArea}',
        temperature: result['tc'],
        cond: result['cond'],
      );
    } else {
      return Future.error(response.statusCode);
    }
  } catch (e) {
    return Future.error(e);
  }
}
