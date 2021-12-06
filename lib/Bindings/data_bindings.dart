import 'package:get/get.dart';
import 'package:self_love/Controllers/data_controller.dart';


class DataBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => DataController());
  }
}