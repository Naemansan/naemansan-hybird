import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/utilities/style/font_styles.dart';
import 'package:naemansan/widget/home/course_start_btn_widget.dart';

class LoginBottomSheetWidget extends StatelessWidget {
  final Function onGooglePressed;
  final Function onKakaoPressed;
  final Function onApplePressed;

  const LoginBottomSheetWidget({
    super.key,
    required this.onGooglePressed,
    required this.onKakaoPressed,
    required this.onApplePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230, // BottomSheet의 높이 설정
      padding: const EdgeInsets.fromLTRB(16, 36, 16, 16),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(32))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '로그인을 해주세요!',
            style: FontStyles.semiBold20.copyWith(
              color: ColorStyles.black,
            ),
          ),
          Text(
            '로그인을 하시면 더 많은 기능을 사용하실 수 있습니다.',
            style: FontStyles.regular16.copyWith(
              color: ColorStyles.gray3,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              // 구글 로그인 버튼
              LoginBtnWidget(
                onPressed: onGooglePressed,
                image: 'assets/icons/google.svg',
              ),
              const SizedBox(width: 30),
              // 카카오톡 로그인 버튼
              LoginBtnWidget(
                onPressed: onKakaoPressed,
                image: 'assets/icons/kakao.svg',
              ),
              const SizedBox(width: 30),
              // 애플 로그인 버튼
              LoginBtnWidget(
                onPressed: onApplePressed,
                image: 'assets/icons/apple.svg',
              ),
            ],
          ),
        ],
      ),
    );
  }

  static void show({
    required BuildContext context,
  }) {
    onGooglePressed() {
      // 구글 로그인 처리
      Get.back();
    }

    onKakaoPressed() {
      // 카카오톡 로그인 처리
      Get.back();
    }

    onApplePressed() {
      // 애플 로그인 처리
      Get.back();
    }

    Get.bottomSheet(
      LoginBottomSheetWidget(
        onGooglePressed: onGooglePressed,
        onKakaoPressed: onKakaoPressed,
        onApplePressed: onApplePressed,
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
