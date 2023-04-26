import 'package:get/get.dart';
import 'package:getx/models/single_event.dart';
import 'package:getx/services/event_services.dart';
import 'package:http/http.dart' as http;

class EventController extends GetxController {
  var isLoading = true.obs;
  List<SingleEvent> eventList = <SingleEvent>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchEvents();
  }

  void fetchEvents() async {
    isLoading(true);
    try {
      var events = await EventService.fetchEvents();
      eventList = events;
    } finally {
      print("done");
      isLoading(false);
      print("object");
    }
  }
}
