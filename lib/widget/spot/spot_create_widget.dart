import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:naemansan/utilities/spot_icon_list.dart';
import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/utilities/style/font_styles.dart';
import 'package:naemansan/viewModel/course_walking_view_model.dart';
import 'package:naemansan/viewModel/image_capture_view_model.dart';

class SpotCreateWidget extends StatelessWidget {
  final CourseWalkingViewModel spotCreateViewModel =
      Get.find<CourseWalkingViewModel>();
  final imageviewModel = Get.put(ImageCaptureViewModel());

  SpotCreateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();

    final RxBool isSubmitEnabled = false.obs;

    void checkFormValid() {
      final isNameFilled = nameController.text.trim().isNotEmpty;
      final isDescriptionFilled = descriptionController.text.trim().isNotEmpty;
      final isIconSelected = spotCreateViewModel.selectedIndex.value != null;

      isSubmitEnabled.value =
          isNameFilled && isDescriptionFilled && isIconSelected;
    }

    nameController.addListener(checkFormValid);
    descriptionController.addListener(checkFormValid);

    return DraggableScrollableSheet(
      expand: false,
      builder: (_, ScrollController scrollController) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 36),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: ListView(
            controller: scrollController,
            children: <Widget>[
              _buildTitleSection(),
              _buildTextField('스팟 이름', '스팟의 이름을 입력하세요.', nameController, 12, 1),
              const SizedBox(height: 28),
              _buildTextField(
                  '스팟 설명', '스팟에 대한 설명을 입력하세요.', descriptionController, 300, 3),
              const SizedBox(height: 28),
              _buildCategorySection(spotCreateViewModel),
              const SizedBox(height: 32),
              Obx(() => _buildButtonRow(
                  context, spotCreateViewModel, isSubmitEnabled.value)),
            ],
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
              itemBuilder: (context, index) {
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
                        isSelected
                            ? ColorStyles.white
                            : ColorStyles.main1, // 선택된 경우와 그렇지 않은 경우에 적용할 색상
                        BlendMode.srcIn, // Blend mode
                      ),
                    ),
                  ),
                );
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
              onPressed: () => Navigator.of(context).pop(),
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
                side: const BorderSide(color: ColorStyles.gray1, width: 2),
                backgroundColor: ColorStyles.white,
                foregroundColor: ColorStyles.gray1,
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    '취소',
                    style: FontStyles.semiBold20.copyWith(),
                  ),
                ),
              ),
            )),
        const SizedBox(width: 16),
        Expanded(
            flex: 4,
            child: TextButton(
              onPressed: isEnabled
                  ? () {
                      viewModel.registerSpot(
                        viewModel.spotName.value,
                        viewModel.spotDescription.value,
                      );
                      Navigator.of(context).pop();
                    }
                  : null, // Button is disabled if form is not valid
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
                backgroundColor:
                    isEnabled ? ColorStyles.main1 : ColorStyles.gray0,
                foregroundColor:
                    isEnabled ? ColorStyles.white : ColorStyles.gray3,
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    '스팟 등록하기',
                    style: FontStyles.semiBold20.copyWith(),
                  ),
                ),
              ),
            )),
      ],
    );
  }
}
