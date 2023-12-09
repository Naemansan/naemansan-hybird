import 'package:flutter/material.dart';
import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/utilities/style/font_styles.dart';

class CustomTextfield extends StatefulWidget {
  final String label;
  final String placeholder;
  final double? height;
  final int maxLength;
  final int maxLine;

  final TextEditingController controller;

  const CustomTextfield(
      {super.key,
      required this.label,
      required this.placeholder,
      this.height,
      required this.maxLine,
      required this.maxLength,
      required this.controller});

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //라벨
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(4, 0, 4, 8),
          child: Text(
            widget.label,
            style: FontStyles.semiBold16.copyWith(
              color: ColorStyles.black,
            ),
          ),
        ),
        //라벨

        //입력부분
        TextField(
          maxLength: widget.maxLength,
          controller: widget.controller,
          maxLines: widget.maxLine,
          decoration: InputDecoration(
            fillColor: ColorStyles.gray0,
            filled: true,
            hintText: widget.placeholder,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
        //입력부분
      ],
    );
  }
}
