import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:naemansan/models/course_walking_single_spot_model.dart';
import 'package:naemansan/utilities/spot_icon_list.dart';
import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/utilities/style/font_styles.dart';
import 'package:naemansan/viewModel/course_walking_view_model.dart';
import 'package:naemansan/viewModel/image_capture_view_model.dart';

class SpotCreateWidget extends StatefulWidget {
  const SpotCreateWidget({Key? key}) : super(key: key);

  @override
  State<SpotCreateWidget> createState() => _SpotCreateWidgetState();
}

class _SpotCreateWidgetState extends State<SpotCreateWidget> {
  final CourseWalkingViewModel spotCreateViewModel =
      Get.find<CourseWalkingViewModel>();

  final imageviewModel = Get.put(ImageCaptureViewModel());

  late final TextEditingController nameController;
  late final TextEditingController descriptionController;
  final RxBool isSubmitEnabled = false.obs;

  void checkFormValid() {
    final isNameFilled = nameController.text.trim().isNotEmpty;
    final isDescriptionFilled = descriptionController.text.trim().isNotEmpty;
    final isIconSelected = spotCreateViewModel.selectedIndex.value != null;

    isSubmitEnabled.value =
        isNameFilled && isDescriptionFilled && isIconSelected;
  }

  // init 상태 초기화
  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    descriptionController = TextEditingController();

    nameController.addListener(() {
      checkFormValid();
      spotCreateViewModel.updateSpotName(nameController.text);
    });

    descriptionController.addListener(() {
      checkFormValid();
      spotCreateViewModel.updateSpotDescription(descriptionController.text);
    });
  }

  // dispose
  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 드래그 가능한 스크롤 가능한 시트
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.9,
      builder: (_, ScrollController scrollController) {
        return GestureDetector(
          // 화면을 터치하면 키보드가 내려감
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 36),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: ListView(
              controller: scrollController,
              children: <Widget>[
                _buildTitleSection(),
                _buildTextField(
                    '스팟 이름', '스팟의 이름을 입력하세요.', nameController, 12, 1),
                const SizedBox(height: 28),
                _buildTextField('스팟 설명', '스팟에 대한 설명을 입력하세요.',
                    descriptionController, 300, 3),
                const SizedBox(height: 28),
                _buildCategorySection(spotCreateViewModel),
                const SizedBox(height: 32),
                Obx(() => _buildButtonRow(
                    context, spotCreateViewModel, isSubmitEnabled.value)),
                const SizedBox(height: 320),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTitleSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '스팟 남기기',
          style: FontStyles.semiBold20.copyWith(color: ColorStyles.black),
        ),
        Text(
          "스팟에 대한 정보를 입력해주세요.",
          style: FontStyles.regular16.copyWith(color: ColorStyles.gray3),
        ),
        const SizedBox(height: 16),
        // 이미지 박스
        Obx(() => Container(
              color: ColorStyles.gray0,
              width: double.infinity,
              height: 200,
              child: imageviewModel.imageFile.value == null
                  ? IconButton(
                      icon: const Icon(Icons.add_a_photo,
                          color: ColorStyles.gray3),
                      onPressed: imageviewModel.pickImageFromCamera,
                    )
                  : Image.file(imageviewModel.imageFile.value!,
                      fit: BoxFit.cover),
            )),
        const SizedBox(height: 20),
      ],
    );
  }

// 텍스트 필드를 만드는 부분
  Widget _buildTextField(String label, String hint,
      TextEditingController controller, int maxLength, int? maxLines) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const SizedBox(width: 4),
            Text(
              label,
              style: FontStyles.semiBold16.copyWith(color: ColorStyles.black),
            ),
          ],
        ),
        const SizedBox(height: 8),
        TextField(
          maxLength: maxLength,
          controller: controller,
          maxLines: maxLines ?? 1,
          decoration: InputDecoration(
            fillColor: ColorStyles.gray0,
            filled: true,
            hintText: hint,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      ],
    );
  }

// 스팟 카테고리를 선택하는 부분
  Widget _buildCategorySection(CourseWalkingViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const SizedBox(width: 4),
            Text(
              "스팟 카테고리",
              style: FontStyles.semiBold16.copyWith(color: ColorStyles.black),
            ),
          ],
        ),
        const SizedBox(height: 8),
        SizedBox(
            height: 48,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: IconConfig.iconLength,
              // itembuilder 내부에서 Obx를 사용하면
              // Obx가 변경되면 해당 위젯만 다시 그려짐
              itemBuilder: (context, index) {
                return Obx(() {
                  // 선택된 아이콘은 색상이 바뀜
                  bool isSelected = viewModel.selectedIndex.value == index;
                  return GestureDetector(
                    onTap: () => viewModel.selectSpotIcon(index),
                    child: Container(
                      width: 48,
                      height: 48,
                      padding: const EdgeInsets.all(8.0),
                      margin: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                      decoration: BoxDecoration(
                        color: isSelected ? ColorStyles.main1 : Colors.white,
                        border: Border.all(
                          color: ColorStyles.main1,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: SvgPicture.asset(
                        IconConfig.iconPaths[index],
                        width: 48,
                        height: 48,
                        colorFilter: ColorFilter.mode(
                          isSelected ? ColorStyles.white : ColorStyles.main1,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  );
                });
              },
            )),
      ],
    );
  }

//취소, 스팟 등록하기 버튼
  Widget _buildButtonRow(
      BuildContext context, CourseWalkingViewModel viewModel, bool isEnabled) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            flex: 2,
            child: TextButton(
              onPressed: () => Get.back(),
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
                side: const BorderSide(color: ColorStyles.gray1, width: 2),
                backgroundColor: ColorStyles.white,
                foregroundColor: ColorStyles.gray1,
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: Center(
                child: Text(
                  '취소',
                  style: FontStyles.semiBold20.copyWith(),
                ),
              ),
            )),
        const SizedBox(width: 16),
        Expanded(
            flex: 4,
            child: TextButton(
              onPressed: isEnabled
                  ? () {
                      //스팟 등록
                      viewModel.registerSpot(
                        viewModel.spotName.value,
                        viewModel.spotDescription.value,
                        viewModel
                            .getSpotCategory(viewModel.selectedIndex.value!),
                      );
                      //스팟창 닫기
                      Get.back();
                    }
                  : null, // Button is disabled if form is not valid
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
                backgroundColor:
                    isEnabled ? ColorStyles.main1 : ColorStyles.gray0,
                foregroundColor:
                    isEnabled ? ColorStyles.white : ColorStyles.gray3,
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: Center(
                child: Text(
                  '스팟 등록하기',
                  style: FontStyles.semiBold20.copyWith(),
                ),
              ),
            )),
      ],
    );
  }
}
