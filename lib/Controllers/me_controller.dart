import 'dart:async';
import 'package:get/get.dart';
import 'package:self_love/Models/get_me.dart';
import 'package:self_love/Utils/api.dart';

class MeController extends GetxController{
  RxList<Me> meList = <Me>[].obs;
  Timer? timer;

  @override
  void onInit() {
    fetchMe();
    super.onInit();
    timer = Timer.periodic(Duration(seconds: 8), (Timer t) => fetchMe());
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void fetchMe() async{
    try {

      var me = await API().getMe();
      if(me != null){
        meList.value = me;
      }
    } finally {

    }
  }

}