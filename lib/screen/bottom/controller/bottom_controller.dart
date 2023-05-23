import 'package:get/get.dart';

class BottomController extends GetxController
{
  RxInt i = 0.obs;

  void ChangeIndex(int index)
  {
    i.value = index;
  }
}