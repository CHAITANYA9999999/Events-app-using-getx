import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/views/event_details.dart';
import 'package:intl/intl.dart';

import '../models/single_event.dart';

class EventTile extends StatelessWidget {
  final SingleEvent event;
  const EventTile(this.event);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => Navigator.of(context)
      //     .pushNamed(EventDetailScreen.routeName, arguments: event),
      onTap: () {
        Get.to(EventDetail(), arguments: event);
        Get.closeAllSnackbars();
        Get.snackbar("GetX", "This snackbar is implmented using GetX",
            snackPosition: SnackPosition.BOTTOM);
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        child: Container(
          padding: const EdgeInsets.all(6),
          width: MediaQuery.of(context).size.width,
          height: 100,
          child: Row(
            children: [
              Container(
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(18)),
                  child: Image.network(event.banner_image),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Text(
                          DateFormat.yMMMd()
                              .format(DateTime.parse(event.date_time)),
                          style: TextStyle(fontSize: 17),
                        ),
                        Text(
                          ' , ',
                          style: TextStyle(fontSize: 17),
                        ),
                        Text(event.date_time.substring(11, 16),
                            style: TextStyle(fontSize: 17)),
                        Text(
                          'PM',
                          style: TextStyle(fontSize: 17),
                        ),
                      ],
                    ),
                    Text(event.title),
                    FittedBox(
                      fit: BoxFit.contain,
                      child: Row(
                        children: [
                          const Icon(Icons.location_on),
                          Text(event.venue_city),
                          const Text('.'),
                          Text(
                            event.venue_country,
                            style: const TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
