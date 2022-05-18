import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:self_love/Controllers/event_controller.dart';
import 'package:self_love/Settings/SizeConfig.dart';

class EventPage extends StatefulWidget {
  EventPage({Key? key}) : super(key: key);

  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  final EventController eventController = Get.put(EventController());
  var monthId;
  var dayId;
  var fds = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Center(
            child: Text(
              "Events",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.w800),
            ),
          ),
          Center(
            child: Text(
              "Let's explore what’s happening nearby",
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "Months",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Obx(() {
              return Container(
                height: 60,
                child: ListView.builder(
                    itemCount: eventController.eventList.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkResponse(
                          child: Container(
                            width: 40,
                            margin: EdgeInsets.only(right: 8),
                            // padding: EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(254, 176, 149, 1),
                            ),
                            child: Center(
                              child: Text(
                                eventController.eventList[index].name,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          onTap: () {
                            print(eventController.eventList[index].name);
                            monthId = eventController.eventList[index].name;
                          });
                    }),
              );
            }),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "Days",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Obx(() {
                return Container(
                  height: 60,
                  child: ListView.builder(
                      itemCount: eventController.eventList.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, months) {
                        return ListView.builder(
                            itemCount:
                                eventController.eventList[months].days.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, days) {
                              if (eventController.eventList[months].name ==
                                  monthId) {
                                // return DayTile(
                                //   days: eventController
                                //       .eventList[months].days[days].day,
                                // );
                                return InkResponse(
                                  child: Container(
                                    width: 55,
                                    margin: EdgeInsets.only(right: 8),
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(254, 176, 149, 1),
                                        borderRadius:
                                            BorderRadius.circular(35)),
                                    child: Center(
                                      child: Text(
                                        eventController
                                            .eventList[months].days[days].day,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    dayId = eventController
                                        .eventList[months].days[days].id;
                                    fds = eventController
                                        .eventList[months].days[days].detail;
                                  },
                                );
                              } else {
                                return SizedBox.shrink();
                              }
                            });
                      }),
                );
              }),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "Challenges",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          // SizedBox(
          //   height: 20,
          // ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Center(
              child: Obx(() {
                return Column(
                  children: [
                    Html(data: "${fds}"),
                    ListView.builder(
                        itemCount: eventController.eventList.length,
                        shrinkWrap: true,
                        // scrollDirection: Axis.vertical,
                        itemBuilder: (context, months) {
                          return ListView.builder(
                              itemCount:
                                  eventController.eventList[months].days.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, days) {
                                return ListView.builder(
                                    itemCount: eventController.eventList[months]
                                        .days[days].challenges.length,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemBuilder: (context, challenges) {
                                      // print(eventController
                                      //     .eventList[months]
                                      //     .days[days]
                                      //     .challenges[challenges]
                                      //     .dayId);
                                      if (eventController
                                              .eventList[months]
                                              .days[days]
                                              .challenges[challenges]
                                              .dayId ==
                                          dayId) {
                                        return Challenges(
                                          name: eventController
                                              .eventList[months]
                                              .days[days]
                                              .challenges[challenges]
                                              .name,
                                          desc: eventController
                                              .eventList[months]
                                              .days[days]
                                              .challenges[challenges]
                                              .detail,
                                        );
                                      } else {
                                        return SizedBox.shrink();
                                      }
                                    });
                              });
                        }),
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class Challenges extends StatelessWidget {
  String name;
  String desc;
  Challenges({required this.name, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 190,
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
          color: Color.fromRGBO(254, 176, 149, 1),
          borderRadius: BorderRadius.circular(8)),
      child: Container(
        padding: EdgeInsets.only(top: 10),
        width: MediaQuery.of(context).size.width - 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              name,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                desc,
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
