import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:getx/controllers/event_controller.dart';

import '../models/single_event.dart';
import 'event_tile.dart';

class HomeScreen extends StatelessWidget {
  final eventController = Get.put(EventController());

  @override
  Widget build(BuildContext context) {
    print(eventController.isLoading.toString());
    print(eventController.isLoading.runtimeType);

    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: Text(
            'Events',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
            ),
            PopupMenuButton(itemBuilder: ((context) {
              return [];
            }))
          ]),
      body: Obx(
        () => eventController.isLoading.toString() == "true"
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemBuilder: ((_, index) {
                  return EventTile(eventController.eventList[index]);
                }),
                itemCount: eventController.eventList.length,
              ),
      ),
    );
  }
}
