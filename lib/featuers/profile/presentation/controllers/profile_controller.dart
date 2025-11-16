import 'dart:io';

import 'package:image_picker/image_picker.dart';

import '../widgets/barrel.dart';

class ProfileController extends GetxController {

  RxInt currentTabsIndex = 0.obs;
  final Rx<File?> profileImage = Rx<File?>(null);
  final ImagePicker picker = ImagePicker();
  late TextEditingController heightController;
  late TextEditingController weightController;
  late TextEditingController previousCSectionController;
  List<int> tabsOrder= [0,1,2].obs;



  @override
  void onInit() {
    super.onInit();
    //all controllers should start with the caching value
    heightController = TextEditingController();
    weightController = TextEditingController();
    previousCSectionController = TextEditingController();
  }


  void reOrderTabsInSwitchMode(int selectedTab){
    tabsOrder.remove(selectedTab);
    tabsOrder.insert(0, selectedTab);
    currentTabsIndex.value=0;

  }

  int get currentTab => tabsOrder[currentTabsIndex.value];


  Future<void> pickProfileImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? img = await picker.pickImage(source: ImageSource.gallery);

      if (img != null) {
        profileImage.value = File(img.path);
      }
    } catch (e) {
      debugPrint("Image picker error: $e");
    }
  }

  @override
  void onClose() {
    heightController.dispose();
    weightController.dispose();
    previousCSectionController.dispose();
    super.onClose();
  }
}
