import 'package:get/get.dart';

class NewController extends GetxController {
  RxBool isShowCard = false.obs;
  RxBool isShowReport = false.obs;
  RxBool isShowHints = true.obs;
  int selectedIndexHome = 0;

  List<String> title = [
    'Home',
    'Account',
    'Support',
    'Wallets',
    'White',
    'News',
    'Social',
    'Social Media',
  ];
  setSelectedIndexHome(int selectedIndexHome) {
    this.selectedIndexHome = selectedIndexHome;
    update();
  }
}
