import 'dart:convert';

import 'package:getx/models/single_event.dart';
import 'package:http/http.dart' as http;

class EventService {
  static var client = http.Client();

  static Future<List<SingleEvent>> fetchEvents() async {
    var response = await client.get(Uri.parse(
        "https://sde-007.api.assignment.theinternetfolks.works/v1/event"));

    if (response.statusCode == 200) {
      print(response.statusCode);

      return eventFromJson(response.body);
    } else {
      print(response.statusCode);
      return [];
    }
  }
}
