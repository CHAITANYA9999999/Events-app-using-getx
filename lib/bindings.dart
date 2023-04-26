import 'package:get/get.dart';

import 'controllers/event_controller.dart';

class EventBinding implements Bindings {
// default dependency
  @override
  void dependencies() {
    Get.lazyPut(() => EventController());
  }
}
