import 'dart:async';
import 'package:get/get.dart';
import 'package:self_love/Models/get_suggestion.dart';
import 'package:self_love/Utils/api.dart';

class SuggestionController extends GetxController{
  // var isLoading = true.obs;
  // var categoryList = <Category>[].obs;
  RxList<Suggestion> suggestionList = <Suggestion>[].obs;
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
    fetchSuggestions();
    super.onInit();
    timer = Timer.periodic(Duration(seconds: 8), (Timer t) => fetchSuggestions());
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void fetchSuggestions() async{
    try {
      // isLoading(true);
      var suggestions = await API().getSuggestions();
      if(suggestions != null){
        suggestionList.value = suggestions;
      }
    } finally {
      // isLoading(false);
    }
  }

}