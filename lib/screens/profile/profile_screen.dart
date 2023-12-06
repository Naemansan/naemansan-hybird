import 'package:flutter/material.dart';
import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/utilities/style/font_styles.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("마이페이지"),
        backgroundColor: ColorStyles.white,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(0, 12, 0, 32),
        child: Column(children: [UserProfile()]),
      ),
    );
  }
}

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorStyles.gray3,
      ),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(children: [
        Text(
          "프로필",
          style: FontStyles.semiBold20.copyWith(color: ColorStyles.black),
        )
      ]),
    );
  }
}
