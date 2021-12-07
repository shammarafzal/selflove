import 'package:get/get.dart';
import 'package:self_love/Models/get_categories.dart';
import 'package:self_love/Utils/api.dart';

class CategoryController extends GetxController{
  var isLoading = true.obs;
  // var categoryList = <Category>[].obs;
  RxList<Category> categoryList = <Category>[].obs;
  @override
  void onInit(){
    super.onInit();
    fetchCategories();
  }

  @override
  void onClose(){
    super.onClose();
  }

  void fetchCategories() async{

      try {
        isLoading(true);
        var categories = await API().getCategories();
        if(categories != null){
          categoryList.value = categories;
        }
      } finally {
        isLoading(false);
      }
      categoryList.refresh();
      update();
  }

}