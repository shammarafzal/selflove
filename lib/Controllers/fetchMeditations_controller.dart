import 'dart:async';

import 'package:get/get.dart';
import 'package:self_love/Models/fetchMeditations.dart';
import 'package:self_love/Utils/api.dart';

class MeditationController extends GetxController {
  // var isLoading = true.obs;
  // var categoryList = <Category>[].obs;
  RxList<FetchMeditations> meditationList = <FetchMeditations>[].obs;
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
    fetchMeditation();
    super.onInit();
    timer =
        Timer.periodic(Duration(seconds: 8), (Timer t) => fetchMeditation());
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void fetchMeditation() async {
    try {
      // isLoading(true);
      var meditation = await API().fetchMeditation();
      if (meditation != null) {
        meditationList.value = meditation;
      }
    } finally {
      // isLoading(false);
    }
  }
}
