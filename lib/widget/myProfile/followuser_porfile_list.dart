import 'package:flutter/material.dart';
import 'package:naemansan/widget/myProfile/followuser_profile.dart';

class FollowuserProfileList extends StatelessWidget {
  final List<String> userList;
  final String type;

  const FollowuserProfileList(
      {Key? key, required this.userList, required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: userList
          .map((element) => FollowuserProfile(
                id: element,
                type: type,
              ))
          .toList(),
    );
  }
}
