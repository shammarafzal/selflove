import 'dart:async';

import 'package:get/get.dart';
import 'package:self_love/Models/get_fitness.dart';
import 'package:self_love/Utils/api.dart';

class FitnessController extends GetxController{
  final String cat_id;

  FitnessController(this.cat_id);
  // var isLoading = true.obs;
  // var categoryList = <Category>[].obs;
  RxList<Fitness> fitnessList = <Fitness>[].obs;
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
    fetchFitnesses();
    super.onInit();
    timer = Timer.periodic(Duration(seconds: 8), (Timer t) => fetchFitnesses());
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void fetchFitnesses() async{
    try {
      // isLoading(true);
      var fitnesses = await API().getFitnesses(cat_id);
      if(fitnesses != null){
        fitnessList.value = fitnesses;
      }
    } finally {
      // isLoading(false);
    }
  }

}