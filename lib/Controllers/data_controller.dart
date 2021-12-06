import 'package:get/get.dart';
import 'package:self_love/Providers/provider.dart';

class DataController extends GetxController with StateMixin<dynamic>{
  @override
  void onInit(){
    super.onInit();
      Provider().getCategories().then((value){
        change(value, status: RxStatus.success());
      },onError: (error){
        change(null, status: RxStatus.error(error.toString()));
      }
      );
  }
  @override
  void onClose(){
    super.onClose();
  }
}