import 'dart:async';

import 'package:get/get.dart';
import 'package:self_love/Models/event_fitness.dart';
import 'package:self_love/Utils/api.dart';

class EventController extends GetxController{
  // var isLoading = true.obs;
  // var categoryList = <Category>[].obs;
  RxList<EventFitness> eventList = <EventFitness>[].obs;
  // @override
  // void onInit(){
  //   fetchCategories();
  //   super.onInit();
  //
  //
  // }
  //
  // @override
  // void onClose(){
  //   super.onClose();
  // }
  Timer? timer;

  @override
  void onInit() {
    fetchEvents();
    super.onInit();
    timer = Timer.periodic(Duration(seconds: 8), (Timer t) => fetchEvents());
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void fetchEvents() async{
      try {
        // isLoading(true);
        var events = await API().fetchCalendars();
        if(events != null){
          eventList.value = events;
        }
      } finally {
        // isLoading(false);
      }
  }

}