import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/utilities/style/font_styles.dart';

class OneBtnBottomSheetWidget extends StatelessWidget {
  final String title;
  final String description;

  const OneBtnBottomSheetWidget({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220, // BottomSheet의 높이 설정
      padding: const EdgeInsets.fromLTRB(16, 36, 16, 16),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(32))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: FontStyles.semiBold20.copyWith(
              color: ColorStyles.black,
            ),
          ),
          Text(
            description,
            style: FontStyles.regular16.copyWith(
              color: ColorStyles.gray3,
            ),
          ),
          const SizedBox(height: 32),
          TextButton(
            onPressed: () => Get.back(),
            style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
                backgroundColor: ColorStyles.main1,
                foregroundColor: ColorStyles.white,
                padding: const EdgeInsets.symmetric(vertical: 12)),
            child: Center(
              child: Text(
                "확인",
                style: FontStyles.semiBold20.copyWith(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static void show({
    required BuildContext context,
    required String title,
    required String description,
  }) {
    Get.bottomSheet(
      OneBtnBottomSheetWidget(
        title: title,
        description: description,
      ),
      barrierColor: Colors.black54, // 반투명한 검은색 배경
      isDismissible: true, // 외부 탭으로 닫을 수 있음
      shape: const RoundedRectangleBorder(
        // 모서리 둥글게
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
    );
  }
}
