import 'dart:convert';

String eventToJson(List<SingleEvent> data) =>
    json.encode(List<dynamic>.from(data.map((e) => e.toJson())));

// List<SingleEvent> eventFromJson(String str) => List<SingleEvent>.from(
//     (json.decode(str) as List<dynamic>).map((e) => SingleEvent.fromJson(e)));
List<SingleEvent> eventFromJson(String str) {
  List<dynamic> jsonList = json.decode(str)["content"]["data"];
  List<SingleEvent> eventList =
      jsonList.map((event) => SingleEvent.fromJson(event)).toList();
  return eventList;
}

class SingleEvent {
  final String id;
  final String title;
  final String description;
  final String banner_image;
  final String date_time;
  final String organiser_name;
  final String organiser_icon;
  final String venue_name;
  final String venue_city;
  final String venue_country;

  SingleEvent(
      {required this.id,
      required this.title,
      required this.description,
      required this.banner_image,
      required this.date_time,
      required this.organiser_name,
      required this.organiser_icon,
      required this.venue_name,
      required this.venue_city,
      required this.venue_country});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'banner_image': banner_image,
      'date_time': date_time,
      'organiser_name': organiser_name,
      'organiser_icon': organiser_icon,
      'venue_name': venue_name,
      'venue_city': venue_city,
      'venue_country': venue_country,
    };
  }

  factory SingleEvent.fromJson(Map<String, dynamic> json) {
    return SingleEvent(
      id: json['id'].toString(),
      title: json['title'],
      description: json['description'],
      banner_image: json['banner_image'],
      date_time: json['date_time'],
      organiser_name: json['organiser_name'],
      organiser_icon: json['organiser_icon'],
      venue_name: json['venue_name'],
      venue_city: json['venue_city'],
      venue_country: json['venue_country'],
    );
  }
}
