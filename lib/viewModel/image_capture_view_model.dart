import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:permission_handler/permission_handler.dart';

class ImageCaptureViewModel extends GetxController {
  var imageFile = Rxn<File>();

  Future<void> pickImageFromCamera() async {
    // 카메라 권한 요청
    var status = await Permission.camera.request();
    if (status.isGranted) {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.camera);

      if (pickedFile != null) {
        imageFile.value = File(pickedFile.path);
      }
    } else {
      // 사용자가 권한을 거부한 경우 처리
      // 예: 경고 메시지 표시
    }
  }
}
