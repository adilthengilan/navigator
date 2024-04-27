//

import 'package:get/get.dart';

class Indexes extends GetxController {
  var SelectedIndexes = 0.obs;
  var mvDrawerIndex = 0.obs;
  bool ishovered = false;
  var mvShowMore = false.obs;

  void mVShowMoreButtons() {
    mvShowMore.value = !mvShowMore.value;
    update();
  }
}
