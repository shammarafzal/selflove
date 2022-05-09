import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:self_love/Controllers/event_controller.dart';

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
      body: Container(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 60, horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          "Events",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 32,
                              fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              "Let's explore what’s happening nearby",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Months",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Obx(() {
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
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          eventController.eventList[index].name,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  onTap: () {
                                    print(
                                        eventController.eventList[index].name);
                                    monthId =
                                        eventController.eventList[index].name;
                                  });
                            }),
                      );
                    }),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Days",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Obx(() {
                      return Container(
                        height: 60,
                        child: ListView.builder(
                            itemCount: eventController.eventList.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, months) {
                              return ListView.builder(
                                  itemCount: eventController
                                      .eventList[months].days.length,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, days) {
                                    if (eventController
                                            .eventList[months].name ==
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
                                              color: Color.fromRGBO(
                                                  254, 176, 149, 1),
                                              borderRadius:
                                                  BorderRadius.circular(35)),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                eventController
                                                    .eventList[months]
                                                    .days[days]
                                                    .day,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        onTap: () {
                                          dayId = eventController
                                              .eventList[months].days[days].id;
                                          fds = eventController
                                              .eventList[months]
                                              .days[days]
                                              .detail;
                                        },
                                      );
                                    } else {
                                      return Text('-');
                                    }
                                  });
                            }),
                      );
                    }),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Challenges",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Obx(() {
                      return Column(
                        children: [
                          Html(data: "${fds}"),
                          Container(
                            child: ListView.builder(
                                itemCount: eventController.eventList.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, months) {
                                  return ListView.builder(
                                      itemCount: eventController
                                          .eventList[months].days.length,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemBuilder: (context, days) {
                                        return ListView.builder(
                                            itemCount: eventController
                                                .eventList[months]
                                                .days[days]
                                                .challenges
                                                .length,
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
                                                return Column(
                                                  children: [
                                                    Challenges(
                                                      name: eventController
                                                          .eventList[months]
                                                          .days[days]
                                                          .challenges[
                                                              challenges]
                                                          .name,
                                                      desc: eventController
                                                          .eventList[months]
                                                          .days[days]
                                                          .challenges[
                                                              challenges]
                                                          .detail,
                                                    ),
                                                  ],
                                                );
                                              } else {
                                                return Center(child: Text(''));
                                              }
                                            });
                                      });
                                }),
                          ),
                        ],
                      );
                    }),
                  ],
                ),
              ),
            )
          ],
        ),
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
      height: 190,
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
          color: Color.fromRGBO(254, 176, 149, 1),
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: <Widget>[
          Expanded(
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
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          desc,
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
